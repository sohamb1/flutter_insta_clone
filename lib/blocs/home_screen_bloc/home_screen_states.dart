import 'package:feedup/blocs/base/base_state.dart';

abstract class HomeScreenStates extends BaseState {}

class UninitializedState extends HomeScreenStates {
  int indexCounter = 0;
  UninitializedState();
}

class LoadNewScreenState extends HomeScreenStates {
  int indexCounter;
  LoadNewScreenState({this.indexCounter});
}

class HomeErrorState extends HomeScreenStates {}
