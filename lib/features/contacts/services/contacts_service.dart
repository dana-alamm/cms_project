import 'package:cms_project_app/core/storage/secure_storage_helper.dart';
import 'package:cms_project_app/features/auth/screens/sign_in_screen.dart';
import 'package:cms_project_app/features/contacts/models/contacts_model.dart';
import 'package:cms_project_app/main.dart';
import 'package:dio/dio.dart';
import 'package:cms_project_app/core/network/api_client.dart';
import 'package:flutter/material.dart';

class ContactsService {
  final ApiClient _apiClient = ApiClient();
  final SecureStorageHelper _storageHelper = SecureStorageHelper();

  Future<ContactResponseModel> getContacts({
    int page = 1,
    int pageSize = 10,
    String? searchQuery,
  }) async {
    try {
      final response = searchQuery == null
          ? await _apiClient.get(
              "api/contacts",
              queryParameters: {"page": page, "pageSize": pageSize},
            )
          : await _apiClient.get(
              "api/contacts/search",
              queryParameters: {
                "page": page,
                "pageSize": pageSize,
                "q": searchQuery,
              },
            );

      return ContactResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        _storageHelper.deleteToken();
        navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(builder: (context) => SignInScreen()),
        );
        throw Exception("Session expired. Please sign in again.");
      } else if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception("Connection timeout. Please check your internet.");
      } else {
        throw Exception("Failed to load contacts. Please try again.");
      }
    } catch (e) {
      throw Exception("An unexpected error occurred.");
    }
  }
}
