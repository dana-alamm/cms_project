import 'package:cms_project_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? width;
  final double height;
  const PrimaryButton({
    super.key, 
    required this.text, 
    this.onPressed, 
    this.isLoading=false, 
    this.width=double.infinity, 
    this.height=60});

  @override
  Widget build(BuildContext context) {
    return Container(
  width: width,
  height: height,
  decoration: BoxDecoration(
    
    boxShadow: [
      BoxShadow(
        color: AppColors.primaryRed.withOpacity(0.35), 
            blurRadius: 18,                                
            offset: const Offset(0, 8),                   
            spreadRadius: 1,
      )
    ]
  ),
  child: ElevatedButton(
    onPressed: isLoading ? null :onPressed, 
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryRed,
      disabledBackgroundColor: AppColors.primaryRed,
      foregroundColor: Colors.white,
      elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
    ),
    child: isLoading
    ? const SizedBox(
      width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: Colors.white,
                ),
    )
    : Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color:Colors.white
      ),
    )
    ),
    );
  }
}