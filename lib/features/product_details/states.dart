part of 'cubit.dart';

class ProductDetailsStates {}

class ProductDetailsLoadingStates extends ProductDetailsStates {}

class ProductDetailsSuccessStates extends ProductDetailsStates {
  ProductData list;

  ProductDetailsSuccessStates({required this.list});
}

class ProductDetailsFailedStates extends ProductDetailsStates {
  final String msg;

  ProductDetailsFailedStates({required this.msg});
}
