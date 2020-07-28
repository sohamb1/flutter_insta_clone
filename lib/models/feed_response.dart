class FeedResponse  {
  List<Post> posts;
  List<Story> stories;

  FeedResponse({this.posts, this.stories});

  factory FeedResponse.fromJson(Map<String, dynamic> json) {
    final posts = json['posts'].cast<Map<String, dynamic>>();
    final stories = json['stories'].cast<Map<String, dynamic>>();
    return FeedResponse(
      posts: new List<Post>.from(
          posts.map((itemsJson) => Post.fromJson(itemsJson))),
      stories: new List<Story>.from(
          stories.map((itemsJson) => Story.fromJson(itemsJson))),
    );
  }
}

class Post {
  dynamic id;
  String authorName;
  String authorImageUrl;
  String timeAgo;
  String imageUrl;

  Post({
    this.id,
    this.authorName,
    this.authorImageUrl,
    this.timeAgo,
    this.imageUrl,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['id'],
        authorName: json['author_name'],
        authorImageUrl: json['author_image_url'],
        timeAgo: json['time_ago'],
        imageUrl: json['post_image_url']);
  }

  @override
  String toString() {
    return ('$id::$authorName::$authorImageUrl::$timeAgo::$imageUrl');
  }
}

class Story {
  dynamic id;
  String authorName;
  String timeAgo;
  Duration duration;
  MediaType mediaType;
  String profileImageUrl;
  String mediaUrl;

  Story({
    this.id,
    this.authorName,
    this.timeAgo,
    this.duration,
    this.profileImageUrl,
    this.mediaType,
    this.mediaUrl,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
        id: json['id'],
        authorName: json['author_name'],
        timeAgo: json['time_ago'],
        profileImageUrl: json['profile_image_url'],
        duration: Duration(seconds: json['duration']),
        mediaType: json['type'] == 'image' ? MediaType.image : MediaType.video,
        mediaUrl: json['post_image_url']);
  }

  @override
  String toString() {
    return ('$id::$authorName::$timeAgo::$mediaUrl');
  }
}

enum MediaType {
  image,
  video
}
