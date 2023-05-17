class ResultModel {
  ResultModel({
    required this.isSuccess,
    required this.errorMessage,
  });
  late final bool isSuccess;
  late final String errorMessage;

  ResultModel.fromJson(Map<String, dynamic> json){
    isSuccess = json['isSuccess'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isSuccess'] = isSuccess;
    _data['errorMessage'] = errorMessage;
    return _data;
  }
}