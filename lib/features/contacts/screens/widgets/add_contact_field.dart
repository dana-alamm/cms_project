import 'package:cms_project_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AddContactField extends StatelessWidget {
  final String title;
  final String hint;
  final bool isName;

  const AddContactField({
    super.key,
    required this.title,
    required this.hint,
    this.isName = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isName
            ? Row(
                children: [
                  Text(
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
                  Text(
                    " *",
                    style: TextStyle(
                      color: AppColors.primaryRed,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w900,
                      fontSize: 13,
                    ),
                  ),
                ],
              )
            : Text(
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
        SizedBox(height: 8),

        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFECECEE),
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFECECEE),
                width: 1.8,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ),
      ],
    );
  }
}
