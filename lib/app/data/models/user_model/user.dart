import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class AppUser {
  int? id;
  String? createdBy;
  DateTime? createdAt;
  dynamic updatedBy;
  dynamic updatedAt;
  String? email;
  String? password;
  String? username;
  bool? activated;
  String? imageUrl;
  String? role;

  AppUser({
    this.id,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
    this.email,
    this.password,
    this.username,
    this.activated,
    this.imageUrl,
    this.role,
  });

  // Named constructor for creating a User from Firebase User
  factory AppUser.fromFirebaseUser(firebase_auth.User firebaseUser) {
    return AppUser(
      email: firebaseUser.email,
      username: firebaseUser.displayName,
      imageUrl: firebaseUser.photoURL,
    );
  }
  factory AppUser.fromMap(Map<String, dynamic> data) => AppUser(
        id: data['id'] as int?,
        createdBy: data['createdBy'] as String?,
        createdAt: data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
        updatedBy: data['updatedBy'] as dynamic,
        updatedAt: data['updatedAt'] as dynamic,
        email: data['email'] as String?,
        password: data['password'] as String?,
        username: data['username'] as String?,
        activated: data['activated'] as bool?,
        imageUrl: data['imageUrl'] as dynamic,
        role: data['role'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'createdBy': createdBy,
        'createdAt': createdAt?.toIso8601String(),
        'updatedBy': updatedBy,
        'updatedAt': updatedAt,
        'email': email,
        'password': password,
        'username': username,
        'activated': activated,
        'imageUrl': imageUrl,
        'role': role,
      };
}
