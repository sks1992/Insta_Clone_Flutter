class RegisterModel {
  late final String userName;
  late final String userEmail;
  late final String userPassword;
  late final String userImage;

  RegisterModel({
    required this.userName,
    required this.userEmail,
    required this.userPassword,
    required this.userImage,
  });

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userName'] = userName;
    _data['userEmail'] = userEmail;
    _data['userPassword'] = userPassword;
    _data['userImage'] = userImage;
    return _data;
  }

  RegisterModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    userEmail = json['userEmail'];
    userPassword = json['userPassword'];
    userImage = json['userImage'];
  }
}
