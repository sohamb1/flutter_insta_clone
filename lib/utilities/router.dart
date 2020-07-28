import 'package:feedup/models/feed_response.dart';
import 'package:feedup/screens/home.dart';
import 'package:feedup/screens/login.dart';
import 'package:feedup/screens/story.dart';
import 'package:feedup/screens/view_post.dart';
import 'package:flutter/material.dart';

const String loginRoute = '/';
const String homeRoute = '/home';
const String viewPostRoute = '/viewPost';
const String viewStoryRoute = '/viewStory';

class Router {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    print(routeSettings.name);
    switch (routeSettings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case viewPostRoute:
        var post = routeSettings.arguments as Post;
        return MaterialPageRoute(
            builder: (_) => ViewPostScreen(
                profileImageUrl: post.authorImageUrl,
                name: post.authorName,
                imageUrl: post.imageUrl,
                timeAgo: post.timeAgo));
      case viewStoryRoute:
        var data = routeSettings.arguments as List<Story>;
        return MaterialPageRoute(builder: (_) => StoryScreen(stories: data));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${routeSettings.name}'),
                  ),
                ));
    }
  }
}
