import 'package:cms_project_app/features/auth/models/user_model.dart';

class SignInResponseModel {
  final String token;
  final UserModel user;
  SignInResponseModel({required this.token, required this.user});

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) {
    return SignInResponseModel(
      token: json["token"],
      user: UserModel.fromJson(json["user"]),
    );
  }
  Map<String, dynamic> toJson() => {"token": token, "user": user.toJson()};
}
