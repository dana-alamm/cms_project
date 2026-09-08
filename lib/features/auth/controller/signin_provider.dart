import 'package:cms_project_app/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

class SigninProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> signin(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _authService.signin(email, password);
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
