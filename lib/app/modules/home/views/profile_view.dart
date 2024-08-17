import 'package:auth_api/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Profile",
        style: AppStyles.semiBold32.copyWith(color: Colors.black),
      ),
    );
  }
}
