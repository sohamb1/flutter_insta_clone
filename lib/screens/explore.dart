import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:feedup/blocs/explore_screen_bloc/explore_screen_events.dart';
import 'package:feedup/blocs/explore_screen_bloc/explore_screen_states.dart';
import 'package:feedup/blocs/explore_screen_bloc/explore_screen_bloc.dart';
import 'package:feedup/constants.dart';
import 'package:feedup/models/explore_response.dart';
import 'package:feedup/screens/view_post.dart';
import 'package:feedup/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ExploreScreen extends StatefulWidget {
  final ExploreScreenBloc bloc;
  ExploreScreen({this.bloc});

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  ExploreScreenBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = widget.bloc ?? BlocProvider.of<ExploreScreenBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: app_background,
        child: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is LoadedState) {
              var data = ExploreResponse.fromJson(jsonDecode(state.response));
              return _buildExploreContent(data);
            } else if (state is LoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is UninitializedState) {
              bloc.add(FetchExploreListEvent());
              return Container();
            } else if (state is ExploreErrorState) {
              showToastMessage('Network Problem!');
              return Container();
            } else {
              return Container();
            }
          },
        ));
  }

  Widget _buildExploreContent(ExploreResponse data) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          _exploreCategories(data),
          Expanded(
            child: Container(
                margin: EdgeInsets.all(4.0),
                child: StaggeredGridView.countBuilder(
                  physics: ScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  itemCount: data.exploreMediaContents.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewPostScreen(
                                name: 'Martha',
                                imageUrl: data.exploreMediaContents[index].imageUrl,
                                profileImageUrl: data.exploreMediaContents[index].imageUrl,
                                timeAgo: '30 mins'),
                          ),
                        );
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.all(Radius.circular(4))),
                          child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                              child: CachedNetworkImage(
                                  imageUrl:
                                      data.exploreMediaContents[index].imageUrl,
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) =>
                                      new Icon(Icons.error))),
                        ),
                    );
                  },
                  staggeredTileBuilder: (int index) =>
                      new StaggeredTile.count(1, index.isEven ? 1.2 : 1.4),
                )),
          ),
        ],
      ),
    );
  }

  Widget _exploreCategories(ExploreResponse data) {
    return Container(
        width: double.infinity,
        height: 35,
        margin: EdgeInsets.only(left: 4, bottom: 4, top: 8),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.exploreCategories.length,
            itemBuilder: (context, index) {
              return Container(
                width: 80,
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                padding: EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Text(
                  data.exploreCategories[index].name,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              );
            }));
  }
}
