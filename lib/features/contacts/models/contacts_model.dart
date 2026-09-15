class ContactModel {
  final int id;
  final String fullName;
  final String? jobTitle;
  final String? company;
  final String email;
  final String? phone;
  final String? linkedInUrl;
  final String? avatar;
  final String? initiatedByName;
  final String? notes;
  final String? countryName;
  final int? statusId;
  final int? sourceId;
  final int? sectorId;
  final bool isDraft;
  final String? dateCreated;

  ContactModel({
    required this.id,
    required this.fullName,
    this.jobTitle,
    this.company,
    required this.email,
    this.phone,
    this.linkedInUrl,
    this.avatar,
    this.initiatedByName,
    this.notes,
    this.countryName,
    this.statusId,
    this.sourceId,
    this.sectorId,
    required this.isDraft,
    this.dateCreated,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'] ?? 0,
      fullName: json['fullName'] ?? '',
      jobTitle: json['jobTitle'],
      company: json['company'],
      email: json['email'] ?? '',
      phone: json['phone'],
      linkedInUrl: json['linkedInUrl'],
      avatar: json['avatar'],
      initiatedByName: json['initiatedByName'],
      notes: json['notes'],
      countryName: json['countryName'],
      statusId: json['statusId'],
      sourceId: json['sourceId'],
      sectorId: json['sectorId'],
      isDraft: json['isDraft'] ?? false,
      dateCreated: json['dateCreated'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "fullName": fullName,
      "jobTitle": jobTitle,
      "company": company,
      "email": email,
      "phone": phone,
      "linkedInUrl": linkedInUrl,
      "avatar": avatar,
      "initiatedByName": initiatedByName,
      "notes": notes,
      "countryName": countryName,
      "statusId": statusId,
      "sourceId": sourceId,
      "sectorId": sectorId,
      "isDraft": isDraft,
      "dateCreated": dateCreated,
    };
  }
}

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
