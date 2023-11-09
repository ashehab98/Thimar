import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';

part 'model.dart';
part 'states.dart';
class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  ProductDetailsCubit() : super(ProductDetailsStates());
Future<void> getData(id)async{
  
  emit(ProductDetailsLoadingStates());
  final response = await DioHelper().getData("products/$id");
  if (response.isSuccess){
    final list =ProductData.fromJson(response.response!.data);
    emit(ProductDetailsSuccessStates(list: list));
  }else{
    emit(ProductDetailsFailedStates(msg: response.message));
  }

}

}
