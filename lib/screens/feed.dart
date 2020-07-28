import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:feedup/blocs/feed_screen_bloc/feed_screen_bloc.dart';
import 'package:feedup/blocs/feed_screen_bloc/feed_screen_events.dart';
import 'package:feedup/blocs/feed_screen_bloc/feed_screen_states.dart';
import 'package:feedup/components/single_post.dart';
import 'package:feedup/constants.dart';
import 'package:feedup/models/feed_response.dart';
import 'package:feedup/utilities/router.dart';
import 'package:feedup/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  FeedScreenBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<FeedScreenBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: app_background,
        child: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is LoadedState) {
              var data = FeedResponse.fromJson(jsonDecode(state.response));
              return _buildFeedContent(data);
            } else if (state is LoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is FeedErrorState) {
              showToastMessage('Network Problem!');
              return Container();
            } else if (state is UninitializedState) {
              bloc.add(FetchFeedListEvent());
              return Container();
            } else {
              return Container();
            }
          },
        ));
  }

  Widget _buildFeedContent(FeedResponse data) {
    return ListView(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      children: <Widget>[
        _buildStoriesList(data.stories),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.posts.length,
            itemBuilder: (context, index) {
              return _buildSinglePost(data.posts[index]);
            }),
      ],
    );
  }

  Widget _buildSinglePost(Post post) {
    return SinglePost(post: post);
  }

  Widget _buildStoriesList(List<Story> stories) {
    return Container(
      width: double.infinity,
      height: 80.0,
      color: app_background,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: stories.length + 1,
          itemBuilder: (BuildContext contex, int index) {
            if (index == 0) {
              return SizedBox(width: 10.0);
            }
            return InkWell(
              onTap: () {
                List<Story> storiesToSend =
                    stories.sublist(index - 1, stories.length);
                Navigator.pushNamed(context, viewStoryRoute, arguments: storiesToSend);
              },
              child: Container(
                margin: EdgeInsets.all(8.0),
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0, 2),
                      blurRadius: 6.0)
                ]),
                child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.8),
                  child: ClipOval(
                    child: CachedNetworkImage(
                        imageUrl: stories[index - 1].profileImageUrl,
                        width: 60.0,
                        height: 60.0,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) =>
                            new Icon(Icons.error)),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
