import 'package:feedup/blocs/profile_screen_bloc/profile_screen_events.dart';
import 'package:feedup/blocs/profile_screen_bloc/profile_screen_states.dart';
import 'package:feedup/services/networking.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ProfileScreenBloc extends Bloc<ProfileScreenEvents, ProfileScreenStates> {
  ProfileScreenBloc() : super(UninitializedState());

  @override
  void onTransition(
      Transition<ProfileScreenEvents, ProfileScreenStates> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<ProfileScreenStates> mapEventToState(
      ProfileScreenEvents event) async* {
    if (event is FetchProfileListEvent) {
      yield LoadingState();

      http.Response response =
          await NetworkHelper().getProfileData(getProfileDummyData);
      if (response.statusCode == 200) {
        yield LoadedState(response: response.body);
      } else {
        yield ProfileErrorState();
      }
    }
  }
}
