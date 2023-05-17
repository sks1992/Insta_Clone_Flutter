class LoginRequestModel {
  LoginRequestModel({
    required this.userName,
    required this.password,
  });

  late final String userName;
  late final String password;

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userName'] = userName;
    _data['password'] = password;
    return _data;
  }
}

class LoginResponseModel {
  LoginResponseModel({
    this.token,
    this.userId,
    this.userName,
    this.userImage,
    required this.isSuccess,
    required this.errorMessage,
  });

  late final String? token;
  late final int? userId;
  late final String? userName;
  late final String? userImage;
  late final bool isSuccess;
  late final String errorMessage;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'] ?? "";
    userId = json['userId'] ?? 0;
    userName = json['userName'] ?? "";
    userImage = json['userImage'] ?? "";
    isSuccess = json['isSuccess'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['userId'] = userId;
    _data['userName'] = userName;
    _data['userImage'] = userImage;
    _data['isSuccess'] = isSuccess;
    _data['errorMessage'] = errorMessage;
    return _data;
  }
}
