import 'package:cached_network_image/cached_network_image.dart';
import 'package:feedup/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewPostScreen extends StatefulWidget {
  final String imageUrl;
  final String timeAgo;
  final String name;
  final String profileImageUrl;

  ViewPostScreen(
      {this.imageUrl, this.timeAgo, this.name, this.profileImageUrl});

  @override
  State<StatefulWidget> createState() => _ViewPostScreenState();
}

class _ViewPostScreenState extends State<ViewPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: app_background,
        elevation: 0.0,
        automaticallyImplyLeading: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context, false)),
      ),
      backgroundColor: app_background,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
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
                                child: ClipOval(
                                  child: Image(
                                    height: 50.0,
                                    width: 50.0,
                                    image: NetworkImage(widget.profileImageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            title: Text(widget.name,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(widget.timeAgo),
                            trailing: IconButton(
                                icon: Icon(Icons.more_horiz),
                                color: Colors.black,
                                onPressed: () => print('More')),
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 6.0, bottom: 6.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: CachedNetworkImage(
                                imageUrl: widget.imageUrl,
                                fit: BoxFit.fitWidth),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.chat),
                                        iconSize: 30.0,
                                        onPressed: () => print('Comment'),
                                      ),
                                      Text(
                                        '350',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
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
            ),
            SizedBox(height: 4.0),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0))),
              child: Column(
                children: <Widget>[
                  _buildComment(),
                  _buildComment(),
                  _buildComment(),
                  _buildComment()
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, -2),
                      blurRadius: 6.0)
                ]),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.grey)),
                contentPadding: EdgeInsets.all(4.0),
                hintText: 'Add a comment',
                prefixIcon: Container(
                  margin: EdgeInsets.all(10.0),
                  width: 48.0,
                  height: 48.0,
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        offset: Offset(0, 2),
                        blurRadius: 6.0)
                  ]),
                  child: CircleAvatar(
                    child: ClipOval(
                      child: Image(
                        height: 48.0,
                        width: 48.0,
                        image: NetworkImage(widget.profileImageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                suffixIcon: Container(
                  margin: EdgeInsets.only(right: 10.0),
                  child: IconButton(
                      icon: Icon(Icons.send, size: 30.0, color: Colors.green)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildComment() {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: ListTile(
        leading: Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
            BoxShadow(
                color: Colors.black45, offset: Offset(0, 2), blurRadius: 6.0)
          ]),
          child: CircleAvatar(
            child: ClipOval(
              child: Image(
                height: 50.0,
                width: 50.0,
                image: NetworkImage(widget.profileImageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Text('Martha', style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Hey! Nice pic.'),
        trailing: IconButton(
          icon: Icon(Icons.favorite_border),
          color: Colors.grey,
          onPressed: () => print('Like comment '),
        ),
      ),
    );
  }
}
