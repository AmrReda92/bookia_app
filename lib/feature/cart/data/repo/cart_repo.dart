import 'package:bookia_application/core/helper/dio_services.dart';
import 'package:bookia_application/feature/cart/data/models/cart_model.dart';

class CartRepo {


 static getCart()async {

    try{
      final response = await DioServices.dio?.get("/cart");
    if(response?.statusCode==200){
      return CartModel.fromJson(response?.data);
    }else{
      return "Error";
    }
    }catch(erorr){
      return "Error ${erorr.toString()}";
    }

  }

static removeFromCart(int cartItemId )async{
   try{
     final respose = await DioServices.dio?.post("/remove-from-cart",
     data: {
       "cart_item_id" : cartItemId ,
     }
     );

     if(respose?.statusCode == 200){
       return respose ;
     }
     else{
       return "Error";
     }
   }catch(error){
     return "Error ${error.toString()}";

   }
}
}