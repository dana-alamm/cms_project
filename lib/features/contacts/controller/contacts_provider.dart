import 'package:cms_project_app/features/contacts/services/contacts_service.dart';
import 'package:cms_project_app/features/contacts/models/contacts_model.dart';
import 'package:flutter/material.dart';

class ContactsProvider extends ChangeNotifier {
  final ContactsService _contactsService = ContactsService();

  List<ContactModel> _contacts = [];
  List<ContactModel> get contacts => _contacts;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  int _currentPage = 1;
  int get currentPage => _currentPage;

  int _totalPages = 1;
  int get totalPages => _totalPages;

  int _totalCount = 0;
  int get totalCount => _totalCount;

  Future<void> fetchContacts({int page = 1, String? query}) async {
    _isLoading = true;
    _currentPage = page;
    notifyListeners();

    try {
      final response = await _contactsService.getContacts(
        page: page,
        searchQuery: query,
      );

      _contacts = response.items;
      _totalPages = response.totalPages;
      _totalCount = response.totalCount;
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
