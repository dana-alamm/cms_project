import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  Future<void> saveToken(String token) async {
    await _storage.write(key: 'access_token', value: token);
  }

  Future<String?> getToken() async {
    String? token = await _storage.read(key: 'access_token');
    return token;
  }

  //for logout:
  Future<void> deleteToken() async {
    await _storage.delete(key: 'access_token');
  }

  Future<void> saveEmail(String email) async {
    await _storage.write(key: 'email', value: email);
  }

  Future<String?> getEmail() async {
    String? email = await _storage.read(key: 'email');
    return email;
  }

  Future<void> deleteEmail() async {
    await _storage.delete(key: 'email');
  }
}
