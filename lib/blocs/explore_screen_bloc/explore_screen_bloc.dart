import 'package:feedup/blocs/explore_screen_bloc/explore_screen_events.dart';
import 'package:feedup/blocs/explore_screen_bloc/explore_screen_states.dart';
import 'package:feedup/services/networking.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ExploreScreenBloc extends Bloc<ExploreScreenEvents, ExploreScreenStates> {
  ExploreScreenBloc() : super(UninitializedState());

  @override
  void onTransition(
      Transition<ExploreScreenEvents, ExploreScreenStates> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<ExploreScreenStates> mapEventToState(
      ExploreScreenEvents event) async* {
    if (event is FetchExploreListEvent) {
      yield LoadingState();

      http.Response response =
          await NetworkHelper().getExploreData(getExploreDummyData);
      if (response.statusCode == 200) {
        yield LoadedState(response: response.body);
      } else {
        yield ExploreErrorState();
      }
    }
  }
}
