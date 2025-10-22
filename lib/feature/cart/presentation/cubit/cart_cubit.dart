import 'package:bloc/bloc.dart';
import 'package:bookia_application/feature/cart/data/repo/cart_repo.dart';
import 'package:meta/meta.dart';

import '../../data/models/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  String? totalPrice;
  getCart({bool withLoading = true})async{
    if(withLoading){
      emit(GetCartLoading());
    }
    final response = await CartRepo.getCart();

    if(response is String){
      emit(GetCartError());
    }else if( response is CartModel){
      totalPrice = response.data?.total;
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
      getCart(withLoading: false);
    }
 }

 updateCart({ required int cartItemId, required int quantity})async{
    emit(UpdateCartLoading());
    final response = await CartRepo.updateCart(cartItemId: cartItemId, quantity : quantity);

    if(response is String){
      emit(UpdateCartError());
    }
    else {
      emit(UpdateCartSuccess());
      getCart();
    }
 }
}
