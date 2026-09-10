import 'package:cms_project_app/core/storage/secure_storage_helper.dart';
import 'package:cms_project_app/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final SecureStorageHelper _storageHelper = SecureStorageHelper();
  bool _isLoading = false;
  bool _isAuthenticated = false;
  bool get isLoading => _isLoading;
  void setAuthenticated(bool value) {
    _isAuthenticated = value;
    notifyListeners();
  }

  Future<void> signin(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _authService.signin(email, password);
      _isAuthenticated = true;
      notifyListeners();
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    try {
      await _storageHelper.deleteToken();
      _isAuthenticated = false;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> getSavedEmail() async {
    return await _storageHelper.getEmail();
  }

  Future<void> handleRememberMe(bool isChecked, String email) async {
    if (isChecked) {
      await _storageHelper.saveEmail(email);
    } else {
      await _storageHelper.deleteEmail();
    }
  }
}
