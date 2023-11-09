import 'package:thimar/features/slider/model.dart';

class SliderStates {}

class GetSliderLoadingState extends SliderStates {}

class GetSliderSuccessState extends SliderStates {
   final List<SliderModel> list;
  GetSliderSuccessState ({ required this.list});
}

class GetSliderFailedState extends SliderStates {
    final String msg;
    GetSliderFailedState ({required this.msg});
}
