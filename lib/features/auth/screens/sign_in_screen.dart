import 'package:cms_project_app/core/theme/app_colors.dart';
import 'package:cms_project_app/core/utils/app_validators.dart';
import 'package:cms_project_app/core/widgets/auth_screen_template.dart';
import 'package:cms_project_app/core/widgets/custom_text_field.dart';
import 'package:cms_project_app/core/widgets/primary_button.dart';
import 'package:cms_project_app/features/auth/controller/signin_provider.dart';
import 'package:cms_project_app/features/auth/screens/signup_screen.dart';
import 'package:cms_project_app/features/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = context.watch<SigninProvider>().isLoading;
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
      bottomContent: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
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
              prefixIcon: Icon(
                Icons.email_outlined,
                color: Colors.grey,
                size: 18,
              ),
              controller: emailController,
              hintText: "Enter your email",
              label: "Email Address",
              keyboardType: TextInputType.emailAddress,
              validator: AppValidators.validateEmail,
            ),
            SizedBox(height: 12),
            CustomTextField(
              prefixIcon: Icon(
                Icons.lock_outline_rounded,
                color: Colors.grey,
                size: 18,
              ),
              controller: passwordController,
              hintText: "Enter your password",
              label: "Password",

              suffixIcon: Icon(
                Icons.visibility_outlined,
                color: Colors.grey,
                size: 18,
              ),
              validator: AppValidators.validatePassword,
            ),
            SizedBox(height: 24),
            isLoading
                ? const CircularProgressIndicator(
                    color: AppColors.primaryRedDak,
                  ) // غيرنا اللون لأحمر عشان يبين
                : PrimaryButton(
                    text: "Sign In",
                    height: 55,
                    onPressed: isLoading
                        ? null
                        : () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                await context.read<SigninProvider>().signin(
                                  emailController.text,
                                  passwordController.text,
                                );
                                if (!context.mounted) return;
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => TestScreen(),
                                  ),
                                );
                              } catch (e) {
                                if (!context.mounted) return;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      e.toString().replaceAll(
                                        "Exception: ",
                                        "",
                                      ),
                                    ),
                                    backgroundColor: AppColors.primaryRedDak,
                                  ),
                                );
                              }
                            } else {
                              return;
                            }
                          },
                  ),
            SizedBox(height: 24),
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
                GestureDetector(
                  child: Text(
                    "Create an Account",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: AppColors.primaryRedDak,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
