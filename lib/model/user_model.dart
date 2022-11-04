class UserModel {
  String email;
  String password;
  String? username;
  String? rePassword;
  UserModel({
    required this.email,
    required this.password,
    this.username,
    this.rePassword,
  });
}
