import 'package:cms_project_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class StatusChips extends StatelessWidget {
  final String title;
  const StatusChips({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Color(0xFFECECEE), width: 1.5),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w900,
            fontSize: 12,
            height: 1.0,
            letterSpacing: 0.2,
            color: AppColors.subtitle,
          ),
        ),
      ),
    );
  }
}
