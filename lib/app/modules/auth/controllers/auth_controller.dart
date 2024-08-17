import 'dart:developer';

import 'package:auth_api/app/data/models/user_model/user.dart';
import 'package:auth_api/app/data/models/user_model/user_model.dart';
import 'package:auth_api/app/data/providers/api_service.dart';
import 'package:auth_api/app/modules/auth/controllers/user_service.dart';
import 'package:auth_api/app/routes/app_pages.dart';
import 'package:auth_api/core/errors/failure_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class AuthController extends GetxController {
  final ApiService _apiService = ApiService();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    isLoading.value = true;
    errorMessage.value = '';

    Either<Failure, UserModel> result =
        await _apiService.login(email, password);

    result.fold(
      (failure) {
        log("Login failed");
        log(failure.errMessage);
        errorMessage.value = failure.errMessage;
      },
      (user) async {
        final token = user.token;
        await UserService.instance.saveUser(user, token!);
        errorMessage.value = '';
        Get.offAllNamed(Routes.HOME);
      },
    );
    isLoading.value = false;
  }

  Future<void> signInWithGoogle() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // The user canceled the sign-in
        isLoading.value = false;
        return;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with the credential
      firebase_auth.UserCredential userCredential = await firebase_auth
          .FirebaseAuth.instance
          .signInWithCredential(credential);

      // Get the Firebase user
      firebase_auth.User firebaseUser = userCredential.user!;

      // Map the Firebase user to your UserModel using the named constructor
      UserModel userModel = UserModel(
        user:
            AppUser.fromFirebaseUser(firebaseUser), // Use the named constructor
        token: await firebaseUser.getIdToken(),
      );

      // Save user data
      await UserService.instance.saveUser(userModel, userModel.token!);

      // Navigate to the home screen
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      log("Google sign-in failed: $e");
      errorMessage.value = "Google sign-in failed. Please try again.";
    } finally {
      isLoading.value = false;
    }
  }
}
