import 'package:cms_project_app/core/theme/app_colors.dart';
import 'package:cms_project_app/core/widgets/auth_screen_template.dart';
import 'package:cms_project_app/core/widgets/custom_text_field.dart';
import 'package:cms_project_app/core/widgets/primary_button.dart';
import 'package:cms_project_app/core/widgets/remember_me.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AuthScreenTemplate(
      topContent: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: const TextSpan(
              text: 'Welcome ',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
              children: [
                TextSpan(
                  text: 'Back',
                  style: TextStyle(color: AppColors.primaryRedDak),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Sign in to access your enterprise dashboard, manage operations, and collaborate securely across your digital ecosystem.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey, height: 1.4),
            ),
          ),
        ],
      ),
      bottomContent: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sign In",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 24,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: 4),
          Text(
            "Enter your credentials to access your account",
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins',
              color: Colors.black38,
            ),
          ),
          SizedBox(height: 24),

          CustomTextField(
            controller: emailController,
            hintText: "Enter your email",
            label: "Email Address",
          ),
          SizedBox(height: 12),
          CustomTextField(
            controller: emailController,
            hintText: "Enter your password",
            label: "Password",
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RememberMe(),
              Text(
                "Can't access your account",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryRedDak,
                  fontFamily: "Poppins",
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          PrimaryButton(text: "Sign In", height: 50, onPressed: () {}),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 8),
              Text(
                "Create an account",
                style: TextStyle(
                  fontFamily: "Poppins",
                  color: AppColors.primaryRedDak,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 80),
        ],
      ),
    );
  }
}
