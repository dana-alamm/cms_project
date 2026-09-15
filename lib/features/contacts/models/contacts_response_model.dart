import 'package:cms_project_app/features/contacts/models/contacts_model.dart';

class ContactResponseModel {
  final List<ContactModel> items;
  final int page;
  final int pageSize;
  final int totalCount;
  final int totalPages;

  ContactResponseModel({
    required this.items,
    required this.page,
    required this.pageSize,
    required this.totalCount,
    required this.totalPages,
  });

  factory ContactResponseModel.fromJson(Map<String, dynamic> json) {
    var list = json['items'] as List? ?? [];
    List<ContactModel> itemsList = list
        .map((i) => ContactModel.fromJson(i))
        .toList();

    return ContactResponseModel(
      items: itemsList,
      page: json['page'] ?? 1,
      pageSize: json['pageSize'] ?? 10,
      totalCount: json['totalCount'] ?? 0,
      totalPages: json['totalPages'] ?? 1,
    );
  }
}
