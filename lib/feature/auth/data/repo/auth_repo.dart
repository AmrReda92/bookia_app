import 'dart:math';

import 'package:bookia_application/core/helper/local_services.dart';
import 'package:bookia_application/feature/auth/data/model/register_request_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
 static Dio dio =Dio(BaseOptions(
    baseUrl: "https://codingarabic.online/api",
    headers: {
      "Accept":"application/json",
      "Content-Type":"application/json"
    }
  ));
  
  static login({required String email ,required String password}) async{

    try{
     final response = await dio.post("/login",data: {
       "email": email,
       "password": password ,
     });

     if(response.statusCode==200){
     await LocalServices.prefs?.setString("userToken", response.data["data"]["token"]);
       return response;
     }else{
       log(response.data["message"]);
       return response.data["message"];
     }
   }catch (e){
     return "Error try again $e";
   }
   }


 static register(RegisterRequestModel registerModel)async{

   try{
    final response= await dio.post("/register",
        data: registerModel.toMap()
    );
    if(response.statusCode==201){
      await  LocalServices.prefs?.setString("userToken", response.data["data"]["token"]);

      return response;
    }else{
      return response.data["message"];
    }
  }catch(e){
    return "Error try again $e";
  }
  }
}

