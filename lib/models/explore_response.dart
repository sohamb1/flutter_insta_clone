class ExploreResponse  {
  List<Post> exploreMediaContents;
  List<Category> exploreCategories;

  ExploreResponse({this.exploreMediaContents, this.exploreCategories});

  factory ExploreResponse.fromJson(Map<String, dynamic> json) {
    final content = json['explore_content'].cast<Map<String, dynamic>>();
    final categories = json['categories'].cast<Map<String, dynamic>>();
    return ExploreResponse(
        exploreMediaContents: new List<Post>.from(
          content.map((itemsJson) => Post.fromJson(itemsJson))),
        exploreCategories: new List<Category>.from(
            categories.map((itemsJson) => Category.fromJson(itemsJson)))
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

class Category {
  dynamic id;
  String name;

  Category({
    this.id,
    this.name
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['id'],
        name: json['name']);
  }

  @override
  String toString() {
    return ('$id::$name');
  }
}
