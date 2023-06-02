class LikeModel {
  LikeModel({
    required this.likeUserKey,
    required this.postUserKey,
    required this.postKey,
    required this.isLiked,
  });

  late final int likeUserKey;
  late final int postUserKey;
  late final int postKey;
  late final bool isLiked;

  LikeModel.fromJson(Map<String, dynamic> json) {
    likeUserKey = json['likeUserKey'];
    postUserKey = json['postUserKey'];
    postKey = json['postKey'];
    isLiked = json['isLiked'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['likeUserKey'] = likeUserKey;
    _data['postUserKey'] = postUserKey;
    _data['postKey'] = postKey;
    _data['isLiked'] = isLiked;
    return _data;
  }
}

class LikePostResponseModel {
  LikePostResponseModel({
    this.likePost,
    required this.isSuccess,
    required this.errorMessage,
  });

  late final bool? likePost;
  late final bool isSuccess;
  late final String errorMessage;

  LikePostResponseModel.fromJson(Map<String, dynamic> json) {
    likePost = json['likePost'];
    isSuccess = json['isSuccess'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['likePost'] = likePost;
    _data['isSuccess'] = isSuccess;
    _data['errorMessage'] = errorMessage;
    return _data;
  }
}
