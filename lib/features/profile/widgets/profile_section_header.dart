import 'package:cms_project_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileSectionHeader extends StatelessWidget {
  final String title;
  const ProfileSectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 13,
          color:AppColors.subtitle,
          height: 1,
        ),
      ),
    );
  }
}