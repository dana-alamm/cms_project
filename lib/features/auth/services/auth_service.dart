import 'package:dio/dio.dart';
import 'package:cms_project_app/core/network/api_client.dart';
import 'package:cms_project_app/core/storage/secure_storage_helper.dart';
import 'package:cms_project_app/features/auth/models/user_model.dart';
import 'package:cms_project_app/features/auth/models/sign_in_response_model.dart';

class AuthService {
  final SecureStorageHelper _storageHelper = SecureStorageHelper();
  final ApiClient _apiClient = ApiClient();

  Future<UserModel?> signin(String email, String password) async {
    try {
      final response = await _apiClient.post(
        "api/auth/login",
        data: {"email": email, "password": password},
      );

      final signInResponse = SignInResponseModel.fromJson(response.data);
      await _storageHelper.saveToken(signInResponse.token);
      return signInResponse.user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception("Invalid email or password.");
      } else if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw Exception(
          "Unable to connect. Please check your internet connection and try again.",
        );
      } else if (e.response?.statusCode == 400) {
        final errorMessage =
            e.response?.data['error'] ?? "Required fields are missing";
        throw Exception(errorMessage);
      } else {
        throw Exception("Something went wrong. Please try again.");
      }
    }
  }

  
  Future<void> signup({
  required String fullName,
  required String email,
  required String password,
}) async {
  try {
    await _apiClient.post(
      "api/auth/signup",
      data: {
        "fullName": fullName,
        "email": email,
        "password": password,
      },
    );
  } on DioException catch (e) {
   
    String? serverMessage;
    if (e.response?.data is Map) {
      serverMessage = e.response?.data['message'] ?? e.response?.data['error'];
    } else if (e.response?.data is String && e.response!.data.isNotEmpty) {
      serverMessage = e.response?.data;
    }

    if (e.response?.statusCode == 400) {
      throw Exception(serverMessage ?? "Required fields are missing or invalid.");
    } else if (e.response?.statusCode == 409) {
      throw Exception(serverMessage ?? "This email is already registered.");
    } else if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.connectionError) {
      throw Exception(
        "Unable to connect. Please check your internet connection and try again.",
      );
    } else {
      throw Exception(serverMessage ?? "Something went wrong. Please try again.");
    }
  } catch (e) {
   
    throw Exception(e.toString().replaceAll("Exception: ", ""));
  }
}
  }