import 'package:feedup/blocs/home_screen_bloc/home_screen_events.dart';
import 'package:feedup/blocs/home_screen_bloc/home_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvents, HomeScreenStates> {
  HomeScreenBloc() : super(UninitializedState());

  @override
  void onTransition(
      Transition<HomeScreenEvents, HomeScreenStates> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<HomeScreenStates> mapEventToState(
      HomeScreenEvents event) async* {
    if (event is LoadNewScreenEvent)
      yield LoadNewScreenState(indexCounter: event.indexCounter);
    else
      yield HomeErrorState();
  }
}
