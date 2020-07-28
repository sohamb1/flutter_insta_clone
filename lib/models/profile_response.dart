class ProfileResponse  {
  String name;
  String location;
  String description;
  String profileImageUrl;
  List<Post> posts;

  ProfileResponse({this.name, this.location, this.description, this.profileImageUrl, this.posts});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    final posts = json['pics'].cast<Map<String, dynamic>>();
    return ProfileResponse(
      name: json['name'],
      location: json['location'],
      description: json['description'],
      profileImageUrl: json['profile_image_url'],
      posts: new List<Post>.from(
          posts.map((itemsJson) => Post.fromJson(itemsJson))),
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