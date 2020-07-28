import 'package:feedup/blocs/explore_screen_bloc/explore_screen_bloc.dart';
import 'package:feedup/blocs/feed_screen_bloc/feed_screen_bloc.dart';
import 'package:feedup/blocs/home_screen_bloc/home_screen_bloc.dart';
import 'package:feedup/blocs/home_screen_bloc/home_screen_events.dart';
import 'package:feedup/blocs/home_screen_bloc/home_screen_states.dart';
import 'package:feedup/blocs/profile_screen_bloc/profile_screen_bloc.dart';
import 'package:feedup/components/custom_app_bar.dart';
import 'package:feedup/constants.dart';
import 'package:feedup/screens/explore.dart';
import 'package:feedup/screens/feed.dart';
import 'package:feedup/screens/profile.dart';
import 'package:feedup/services/locator_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _screensList;
  List<Widget> _appBarList;
  HomeScreenBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = locator<HomeScreenBloc>();
    _screensList = [
      FeedScreen(),
      ExploreScreen(),
      FeedScreen(),
      ExploreScreen(),
      ProfileScreen()
    ];
    _appBarList = [
      FeedAppBar(height: app_bar_height),
      ExploreAppBar(height: app_bar_height),
      FeedAppBar(height: app_bar_height),
      ExploreAppBar(height: app_bar_height),
      ProfileAppBar(height: app_bar_height)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bloc,
        builder: (context, state) {
          return Scaffold(
              appBar: CustomAppBar(
                  height: app_bar_height,
                  child: AppBar(
                      automaticallyImplyLeading: false, // hides leading widget
                      flexibleSpace: SafeArea(
                          child: state is LoadNewScreenState
                              ? _appBarList[state.indexCounter]
                              : _appBarList[0]))),
              backgroundColor: app_background,
              body: MultiBlocProvider(
                  providers: [
                    BlocProvider<FeedScreenBloc>(
                      create: (_) => FeedScreenBloc(),
                    ),
                    BlocProvider<ExploreScreenBloc>(
                      create: (_) => ExploreScreenBloc(),
                    ),
                    BlocProvider<ProfileScreenBloc>(
                      create: (_) => ProfileScreenBloc(),
                    )
                  ],
                  child: SafeArea(
                      child: IndexedStack(
                          index: state.indexCounter ?? 0,
                          children: _screensList))),
              bottomNavigationBar:
                  _buildBottomNavigationBar(state.indexCounter));
        });
  }

  void onTabItemTapped(int index) {
    _bloc.add(LoadNewScreenEvent(indexCounter: index));
  }

  Widget _buildBottomNavigationBar(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
      child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: index ?? 0,
          onTap: onTabItemTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard,
                    size: 30.0, color: index == 0 ? Colors.black : Colors.grey),
                title: Text('')),
            BottomNavigationBarItem(
                icon: Icon(Icons.search,
                    size: 30.0, color: index == 1 ? Colors.black : Colors.grey),
                title: Text('')),
            BottomNavigationBarItem(
                icon: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  color: Colors.green,
                  onPressed: () => print('Upload Photo'),
                  child: Icon(Icons.add, size: 25.0, color: Colors.white),
                ),
                title: Text('')),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border,
                    size: 30.0, color: index == 3 ? Colors.black : Colors.grey),
                title: Text('')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline,
                    size: 30.0, color: index == 4 ? Colors.black : Colors.grey),
                title: Text(''))
          ]),
    );
  }
}
