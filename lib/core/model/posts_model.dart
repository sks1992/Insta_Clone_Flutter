class CreatePostModel {
  CreatePostModel({
    required this.userId,
    required this.postImageUrl,
    required this.postDescription,
  });
  late final int userId;
  late final String postImageUrl;
  late final String postDescription;

  CreatePostModel.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
    postImageUrl = json['postImageUrl'];
    postDescription = json['postDescription'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userId'] = userId;
    _data['postImageUrl'] = postImageUrl;
    _data['postDescription'] = postDescription;
    return _data;
  }
}