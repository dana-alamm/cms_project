import 'package:cms_project_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class RememberMe extends StatelessWidget {
  final bool isChecked;
  final Function(bool?) onChanged;
  const RememberMe({
    super.key,
    this.isChecked = false,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Checkbox(
            value: isChecked,
            onChanged: onChanged,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            side: BorderSide(color: Colors.grey.shade400, width: 1.5),
            activeColor: AppColors.primaryRed,
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          'Remember me',
          style: TextStyle(
            fontSize: 13,
            color: Colors.black87,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
