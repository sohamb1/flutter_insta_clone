import 'package:feedup/blocs/base/base_state.dart';

abstract class FeedScreenStates extends BaseState {}

class UninitializedState extends FeedScreenStates {
  UninitializedState();
}

class LoadingState extends FeedScreenStates {}

class LoadedState extends FeedScreenStates {
  String response;
  LoadedState({this.response});
}

class FeedErrorState extends FeedScreenStates {}
