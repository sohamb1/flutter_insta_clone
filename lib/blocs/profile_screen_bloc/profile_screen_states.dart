import 'package:feedup/blocs/base/base_state.dart';

abstract class ProfileScreenStates extends BaseState {}

class UninitializedState extends ProfileScreenStates {
  UninitializedState();
}

class LoadingState extends ProfileScreenStates {}

class LoadedState extends ProfileScreenStates {
  String response;
  LoadedState({this.response});
}

class ProfileErrorState extends ProfileScreenStates {}
