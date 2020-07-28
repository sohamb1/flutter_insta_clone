import 'package:feedup/constants.dart';
import 'package:feedup/services/locator_service.dart';
import 'package:feedup/utilities/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color_status_bar,
    ));
    return MaterialApp(
        title: 'FeedUp',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Router.generateRoute,
        initialRoute: loginRoute);
  }
}
