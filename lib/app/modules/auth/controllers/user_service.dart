import 'package:auth_api/app/data/models/user_model/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class UserService extends GetxService {
  static UserService get instance => Get.find<UserService>();

  final storage = const FlutterSecureStorage();
  var user = Rx<UserModel?>(null);

  Future<void> saveUser(UserModel userModel, String token) async {
    user.value = userModel;
    await storage.write(key: 'token', value: token);

    await storage.write(key: 'user', value: userModel.toJson());
  }

  Future<void> loadUser() async {
    final token = await storage.read(key: 'token');
    final userJson = await storage.read(key: 'user');
    if (token != null && userJson != null) {
      user.value = UserModel.fromJson(userJson);
    }
  }

  Future<void> logout() async {
    user.value = null;
    await storage.delete(key: 'token');
    await storage.delete(key: 'user');
  }
}
