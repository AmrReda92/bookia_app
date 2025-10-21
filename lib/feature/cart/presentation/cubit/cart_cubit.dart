import 'package:bloc/bloc.dart';
import 'package:bookia_application/feature/cart/data/repo/cart_repo.dart';
import 'package:meta/meta.dart';

import '../../data/models/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  getCart()async{
    emit(GetCartLoading());
    final response = await CartRepo.getCart();

    if(response is String){
      emit(GetCartError());
    }else if( response is CartModel){
      emit(GetCartSuccess(response.data?.cartItems??[]));
    }
  }
  removeFromCart(int cartItemId)async{
    emit(RemoveFromCartLoading());
    final response = await CartRepo.removeFromCart(cartItemId);

    if(response is String){
      emit(RemoveFromCartError());
    }else{
      emit(RemoveFromCartSuccess());
      getCart();
    }
 }
}
