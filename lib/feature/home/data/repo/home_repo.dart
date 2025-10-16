import 'package:bookia_application/core/helper/dio_services.dart';
import 'package:bookia_application/feature/home/data/models/product_model.dart';
import 'package:bookia_application/feature/home/data/models/slider_model.dart';

class HomeRepo {


 static getHomeSlider () async{
    try{
      final response = await DioServices.dio!.get("/sliders");
      if(response.statusCode==200){
        return SliderModel.fromJson(response.data);
      }else {
        return "Error";
      }
    }catch(error){
    return error.toString();
    }
  }

 static getHomeBook () async{
   try{
     final response = await DioServices.dio!.get("/products-bestseller") ;
     if(response.statusCode==200) {
       return ProductModel.fromJson(response.data);
     }
      else{
        return "Error";
     }
   }catch(error){
    return error.toString();
   }
 }
}