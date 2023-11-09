 import 'package:thimar/features/categories_details/model.dart';

class CategoriesDetailsStates {}

class CategoriesDetailsLoadingState extends CategoriesDetailsStates {}

class CategoriesDetailsSuccessState extends CategoriesDetailsStates {
  final List<CategoriesDetailsModel> list;
  CategoriesDetailsSuccessState({required this.list});
}

class CategoriesDetailsFailedState extends CategoriesDetailsStates {
  final String msg;
  CategoriesDetailsFailedState({required this.msg});
}
