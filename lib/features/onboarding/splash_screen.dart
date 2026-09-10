import 'package:cms_project_app/core/storage/secure_storage_helper.dart';
import 'package:cms_project_app/features/auth/screens/sign_in_screen.dart';
import 'package:cms_project_app/features/dashboard/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:cms_project_app/core/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SecureStorageHelper _storageHelper = SecureStorageHelper();

  @override
  void initState() {
    super.initState();
    navigateBasedOnToken();
  }

  Future<void> navigateBasedOnToken() async {
    await Future.delayed(const Duration(seconds: 2));

    String? token = await _storageHelper.getToken();

    if (!mounted) return;

    if (token != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: Center(
        child: SizedBox(
          width: 55,
          height: 55,
          child: CircularProgressIndicator(
            color: AppColors.primaryRedDak,
            strokeWidth: 5,
            strokeCap: StrokeCap.round,
            backgroundColor: AppColors.primaryRedDak.withOpacity(0.12),
          ),
        ),
      ),
    );
  }
}
