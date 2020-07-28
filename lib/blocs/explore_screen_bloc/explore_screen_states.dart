import 'package:feedup/blocs/base/base_state.dart';

abstract class ExploreScreenStates extends BaseState {}

class UninitializedState extends ExploreScreenStates {
  UninitializedState();
}

class LoadingState extends ExploreScreenStates {}

class LoadedState extends ExploreScreenStates {
  String response;
  LoadedState({this.response});
}

class ExploreErrorState extends ExploreScreenStates {}
