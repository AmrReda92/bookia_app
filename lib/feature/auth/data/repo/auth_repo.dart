import 'package:dio/dio.dart';

class AuthRepo {

  Dio dio =Dio(BaseOptions(
    baseUrl: "https://codingarabic.online/api",
    headers: {
      "Accept": "application/json",
      "Content-Type" : "application/json"
    }
  ));

  login({required String email,required String password})async{
    final response = await dio.post("/login",data:{
      "email" : email,
      "password" : password
    });

    if(response.statusCode==200){
      return response;
    }else {
      return response.data["message"];
    }
  }
}