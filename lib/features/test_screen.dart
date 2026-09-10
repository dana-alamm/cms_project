import 'package:cms_project_app/core/storage/secure_storage_helper.dart';
import 'package:cms_project_app/features/auth/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  TestScreen({super.key});
  SecureStorageHelper _storageHelper = SecureStorageHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Yessss it works!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                _storageHelper.deleteToken();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
              },
              child: Text("Log out"),
            ),
          ],
        ),
      ),
    );
  }
}
