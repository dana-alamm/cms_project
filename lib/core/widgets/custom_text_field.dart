import 'package:cms_project_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final bool obscureText;
final bool readOnly;
final VoidCallback? onTap;
final TextInputType keyboardType;
final Widget? prefixIcon;
final Widget? suffixIcon;
final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextField({
    super.key, 
    required this.controller,
     required this.hintText, 
     this.obscureText=false, 
     this.readOnly=false, 
     this.onTap, 
     this.keyboardType=TextInputType.text, 
     this.prefixIcon, 
     this.suffixIcon, 
     this.validator, 
     this.inputFormatters, 
     required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
       style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.labelColor,
       ),
      ),
      const SizedBox(height: 8,),
       TextFormField(
        controller: controller,
        obscureText: obscureText,
        readOnly: readOnly,
        onTap: onTap,
        keyboardType: keyboardType,
        validator: validator,
        inputFormatters: inputFormatters,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 16,
          
          fontWeight: FontWeight.w400
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.textMuted,fontSize: 16),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 16,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          errorStyle: const TextStyle(height: 0.8),

          filled: true,
          fillColor: AppColors.inputFill,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              
              borderSide: const BorderSide(color: AppColors.primaryRed), 
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
        ),
      ),
    ],
    );
  }
}