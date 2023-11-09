import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/features/notifications/model.dart';
import 'package:thimar/features/notifications/states.dart';

class NotificationsCubit extends Cubit<NotificationsStates> {
  NotificationsCubit() : super(NotificationsStates());
  Future<void> getData() async {
    emit(NotificationsLoadingState());
    final response = await DioHelper().getData("notifications");
    if (response.isSuccess) {
      final list = NotificationsData.fromJson(response.response!.data).data.notifications;
      emit(NotificationsSuccessState(list: list));
     } else {
      emit(NotificationsFailedState(msg: response.message));
    }
  }
}
