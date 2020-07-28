import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:feedup/blocs/profile_screen_bloc/profile_screen_bloc.dart';
import 'package:feedup/blocs/profile_screen_bloc/profile_screen_events.dart';
import 'package:feedup/blocs/profile_screen_bloc/profile_screen_states.dart';
import 'package:feedup/models/profile_response.dart';
import 'package:feedup/screens/view_post.dart';
import 'package:feedup/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileScreenBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<ProfileScreenBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bloc,
        builder: (context, state) {
          if (state is LoadedState) {
            var data = ProfileResponse.fromJson(jsonDecode(state.response));
            return Column(
              children: <Widget>[
                buildProfileContent(data),
              ],
            );
          } else if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProfileErrorState) {
            showToastMessage('Network Problem!');
            return Container();
          } else if (state is UninitializedState) {
            _bloc.add(FetchProfileListEvent());
            return Container();
          } else {
            return Container();
          }
        });
  }

  Widget buildProfileContent(ProfileResponse data) {
    return Expanded(
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                        BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 2),
                            blurRadius: 6.0)
                      ]),
                      child: CircleAvatar(
                        child: ClipOval(
                          child: Image(
                            height: 80.0,
                            width: 80.0,
                            image: NetworkImage(data.profileImageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    FlatButton(
                      shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                        color: Colors.black,
                        textColor: Colors.white,
                        child: Text('Edit Profile')
                    ,onPressed: () {

                    },)
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                child: Text(data.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                        color: Colors.black)),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
                child: Text(data.location,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15.0,
                        color: Colors.grey)),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
                child: Text(data.description,
                    style:
                        TextStyle(fontWeight: FontWeight.w300, fontSize: 15.0)),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 42, right: 42, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('1789',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        'Followers',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('236',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        'Following',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('990',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        'Likes',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          _showGridProfile(data)
        ],
      ),
    );
  }

  Widget _showGridProfile(ProfileResponse data) {
    return Container(
        margin: EdgeInsets.only(top: 24, left: 4.0, right: 4.0, bottom: 4.0),
        child: StaggeredGridView.countBuilder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 3,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          itemCount: data.posts.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewPostScreen(
                        name: 'Gal Gadot',
                        imageUrl: data.posts[index].imageUrl,
                        profileImageUrl: data.posts[index].imageUrl,
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
                        imageUrl: data.posts[index].imageUrl,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) =>
                            new Icon(Icons.error))),
              ),
            );
          },
          staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(1, index.isEven ? 1.2 : 1.2),
        ));
  }
}
