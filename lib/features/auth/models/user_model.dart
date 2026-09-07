class UserModel {
  final int id;
  final String fullName;
  final String email;
  final String? role;
  final String? title;
  final String? avatarUrl;
  final String createdAt;
  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.createdAt,
    this.title,
    this.avatarUrl,
    this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      fullName: json["fullName"],
      email: json["email"],
      role: json["role"],
      title: json["title"],
      avatarUrl: json["avatarUrl"],
      createdAt: json["createdAt"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullName": fullName,
    "email": email,
    "role": role,
    "title": title,
    "avatarUrl": avatarUrl,
    "createdAt": createdAt,
  };
}
