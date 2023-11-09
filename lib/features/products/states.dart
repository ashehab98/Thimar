part of'cubit.dart';

class ProductsStates {}
class ProductsLoadingState extends ProductsStates {}
class ProductsSuccessState extends ProductsStates {
  final List<ProductsModel> list;
  ProductsSuccessState ({required this.list});
}
class ProductsFailedState extends ProductsStates {
final String msg;
ProductsFailedState({required this.msg});
}
