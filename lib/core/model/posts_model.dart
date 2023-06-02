class CreatePostModel {
  CreatePostModel({
    required this.userId,
    required this.postImageUrl,
    required this.postDescription,
  });

  late final int userId;
  late final String postImageUrl;
  late final String postDescription;

  CreatePostModel.fromJson(Map<String, dynamic> json) {
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

class Posts {
  Posts({
    required this.postId,
    required this.userId,
    required this.userName,
    required this.userImageUrl,
    required this.postDescription,
    required this.postImage,
    required this.publishedDate,
    required this.postLikes,
  });

  late final int postId;
  late final int userId;
  late final String userName;
  late final String userImageUrl;
  late final String postDescription;
  late final String postImage;
  late final String publishedDate;
  late final int postLikes;

  Posts.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    userId = json['userId'];
    userName = json['userName'];
    userImageUrl = json['userImageUrl'];
    postDescription = json['postDescription'];
    postImage = json['postImage'];
    publishedDate = json['publishedDate'];
    postLikes = json['postLikes'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['postId'] = postId;
    _data['userId'] = userId;
    _data['userName'] = userName;
    _data['userImageUrl'] = userImageUrl;
    _data['postDescription'] = postDescription;
    _data['postImage'] = postImage;
    _data['publishedDate'] = publishedDate;
    _data['postLikes'] = postLikes;
    return _data;
  }
}

class PostsByIdModel {
  PostsByIdModel({
    required this.posts,
    required this.isSuccess,
    required this.errorMessage,
  });

  late final List<Posts> posts;
  late final bool isSuccess;
  late final String errorMessage;

  PostsByIdModel.fromJson(Map<String, dynamic> json) {
    posts = List.from(json['posts']).map((e) => Posts.fromJson(e)).toList();
    isSuccess = json['isSuccess'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['posts'] = posts.map((e) => e.toJson()).toList();
    _data['isSuccess'] = isSuccess;
    _data['errorMessage'] = errorMessage;
    return _data;
  }
}
