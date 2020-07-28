
import 'package:feedup/blocs/feed_screen_bloc/feed_screen_events.dart';
import 'package:feedup/blocs/feed_screen_bloc/feed_screen_states.dart';
import 'package:feedup/services/networking.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class FeedScreenBloc extends Bloc<FeedScreenEvents, FeedScreenStates> {
  FeedScreenBloc() : super(UninitializedState());

  @override
  void onTransition(
      Transition<FeedScreenEvents, FeedScreenStates> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<FeedScreenStates> mapEventToState(FeedScreenEvents event) async* {
    if (event is FetchFeedListEvent) {
      yield LoadingState();

      http.Response response =
          await NetworkHelper().getFeedUpData(getFeedUpDummyData);
      if (response.statusCode == 200) {
        yield LoadedState(response: response.body);
      } else {
        yield FeedErrorState();
      }
    }
  }
}
