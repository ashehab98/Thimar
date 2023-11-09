
import 'package:thimar/features/fav_details/model.dart';

class FavDetailsStates {}

class FavDetailsLoadingState extends FavDetailsStates {}

class FavDetailsSuccessState extends FavDetailsStates {
  final List<FavDetailsModel> list;
  FavDetailsSuccessState({required this.list});
}

class FavDetailsFailedState extends FavDetailsStates {
  final String msg;
  FavDetailsFailedState({required this.msg});
}
