import 'package:feedup/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {
  final Widget child;
  final double height;

  CustomAppBar({@required this.child, this.height = kToolbarHeight});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: app_background,
      alignment: Alignment.center,
      child: child,
    );
  }
}

class FeedAppBar extends StatelessWidget {
  final double height;

  const FeedAppBar({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      color: app_background,
      padding: EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('FeedUp',
              style: TextStyle(fontFamily: 'Billabong', fontSize: 28.0)),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.live_tv),
                onPressed: () => print('IGTV'),
              ),
              SizedBox(
                width: 5.0,
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () => print('Direct Message'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ExploreAppBar extends StatelessWidget {
  final double height;

  const ExploreAppBar({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: height,
      color: app_background,
      child: TextFormField(
        style: TextStyle(
          fontSize: 20,
        ),
        cursorColor: Colors.black,
        decoration: new InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: 'Search'),
      ),
    );
  }
}

class ProfileAppBar extends StatelessWidget {
  final double height;

  const ProfileAppBar({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20.0, top: 15.0, bottom: 15.0),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: height,
      color: app_background,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('martha_92',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20)),
              Icon(Icons.keyboard_arrow_down)
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.grid_on, color: Colors.green,),
              SizedBox(width: 20),
              Icon(Icons.menu),
            ],
          ),
        ],
      ),
    );
  }
}
