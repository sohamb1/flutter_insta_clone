import 'package:feedup/blocs/explore_screen_bloc/explore_screen_bloc.dart';
import 'package:feedup/blocs/feed_screen_bloc/feed_screen_bloc.dart';
import 'package:feedup/blocs/home_screen_bloc/home_screen_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setUpLocator() {
  locator.registerLazySingleton(() => HomeScreenBloc());
}
