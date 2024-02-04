import 'package:thimar/views/faqs/model.dart';

class FaqsStates {}

class FaqsLoadingState extends FaqsStates {}

class FaqsSuccessState extends FaqsStates {
  final List<FaqsModel> list;

  FaqsSuccessState({required this.list});
}

class FaqsFailedState extends FaqsStates {
  final String msg;

  FaqsFailedState({required this.msg});
}
