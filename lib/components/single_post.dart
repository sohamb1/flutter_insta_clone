import 'package:cached_network_image/cached_network_image.dart';
import 'package:feedup/models/feed_response.dart';
import 'package:feedup/utilities/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SinglePost extends StatelessWidget {
  final Post post;
  SinglePost({this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Wrap(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                offset: Offset(0, 2),
                                blurRadius: 6.0)
                          ]),
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.8),
                        child: ClipOval(
                          child: CachedNetworkImage(
                              imageUrl: post.authorImageUrl,
                              width: 50.0,
                              height: 50.0,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) =>
                              new Icon(Icons.error)),
                        ),
                      ),
                    ),
                    title: Text(post.authorName,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(post.timeAgo),
                    trailing: IconButton(
                        icon: Icon(Icons.more_horiz),
                        color: Colors.black,
                        onPressed: () => print('More')),
                  ),
                  Container(
                    width: double.infinity,
                    height: 400.0,
                    margin: EdgeInsets.only(top: 6.0, bottom: 6.0),
                    decoration: BoxDecoration(color: Colors.white),
                    child: CachedNetworkImage(
                        imageUrl: post.imageUrl, fit: BoxFit.fitHeight),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.favorite_border),
                                  iconSize: 30.0,
                                  onPressed: () => print('Like Post'),
                                ),
                                Text(
                                  '2,515',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 10.0),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, viewPostRoute, arguments: post);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.chat,
                                    color: Colors.black,
                                  ),
                                  iconSize: 30.0,
                                ),
                                Text(
                                  '350',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: IconButton(
                          icon: Icon(Icons.bookmark_border),
                          iconSize: 30.0,
                          onPressed: () => print('Save post'),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}