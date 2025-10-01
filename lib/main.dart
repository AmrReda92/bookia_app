

import 'package:bookia_application/core/helper/dio_services.dart';
import 'package:bookia_application/core/helper/local_services.dart';
import 'package:flutter/material.dart';
import 'bookia.dart';

void main ()async{

  WidgetsFlutterBinding.ensureInitialized();
  DioServices.init();
  await LocalServices.init();
  runApp(Bookia());
}