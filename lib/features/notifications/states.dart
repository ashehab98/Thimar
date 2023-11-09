 import 'package:thimar/features/notifications/model.dart';

class NotificationsStates {}

class NotificationsLoadingState extends NotificationsStates {}

class NotificationsSuccessState extends NotificationsStates {
  List<Notifications> list;
  NotificationsSuccessState({required this.list});
}

class NotificationsFailedState extends NotificationsStates {
  final String msg;

  NotificationsFailedState({required this.msg});
}
