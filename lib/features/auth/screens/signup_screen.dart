import 'package:cms_project_app/core/theme/app_colors.dart';
import 'package:cms_project_app/core/widgets/auth_screen_template.dart';
import 'package:cms_project_app/core/widgets/custom_text_field.dart';
import 'package:cms_project_app/core/widgets/primary_button.dart';
import 'package:cms_project_app/core/widgets/remember_me.dart';
import 'package:cms_project_app/features/auth/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _rememberMe = false;
  bool loader = false;

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthScreenTemplate(
      topContent: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'Welcome',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 34,
              fontWeight: FontWeight.w700,
              height: 39 / 34,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 12),

          Padding(

            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Sign up to create your enterprise account, manage operations, and collaborate securely across your digital ecosystem.',
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 13,
                height: 21 / 13,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      bottomContent: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                'Sign up',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: 21,
                  height: 1,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 6),
            const Center(
              child: Text(
                'Sign up to create your account',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  height: 1,
                  color: AppColors.textMuted,
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: fullNameController,
              hintText: 'Enter your name',
              label: 'Full Name',
              prefixIcon: const Icon(Icons.person_outlined, color: AppColors.textMuted, size: 20),
              validator: (val) => val == null || val.trim().isEmpty ? 'Please enter your name' : null,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: emailController,
              hintText: 'Enter your email',
              label: 'Email Address',
              prefixIcon: const Icon(Icons.mail_outlined, color: AppColors.textMuted, size: 20),
              keyboardType: TextInputType.emailAddress,
              validator: (val) {
                if (val == null || val.trim().isEmpty) return 'Please enter your email!';
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(val.trim())) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: passwordController,
              hintText: 'Enter your password',
              label: 'Password',
              obscureText: _obscurePassword,
              prefixIcon: const Icon(Icons.lock_outline, color: AppColors.textMuted, size: 20),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  color: AppColors.textMuted,
                  size: 20,
                ),
              ),
              validator: (val) => val == null || val.length < 6 ? 'Password must be at least 6 characters' : null,
            ),
            const SizedBox(height: 15),
            const RememberMe(),
            const SizedBox(height: 20),
            PrimaryButton(
              text: 'Sign Up',
              height: 52,
              onPressed: () {
               
              },
            ),
            const SizedBox(height: 15),
            Row(
              children: const [
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'or',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      height: 1.5,
                      letterSpacing: -0.32,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            SizedBox(
              height: 50,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Continue with Google',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        height: 1,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      'assets/images/google-icon-removebg-preview.png',
                      height: 22,
                      width: 22,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            Center(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                       MaterialPageRoute(builder: (context)=> SignInScreen()));
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryRed,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}