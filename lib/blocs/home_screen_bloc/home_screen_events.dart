import 'package:feedup/blocs/base/base_event.dart';

abstract class HomeScreenEvents extends BaseEvent {}

class LoadNewScreenEvent extends HomeScreenEvents {
  int indexCounter;
  LoadNewScreenEvent({this.indexCounter});
}
