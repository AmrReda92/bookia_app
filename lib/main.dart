

import 'package:bookia_application/core/helper/dio_services.dart';
import 'package:bookia_application/core/helper/local_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bookia.dart';

void main ()async{

  WidgetsFlutterBinding.ensureInitialized();
  await LocalServices.init();
  DioServices.init();
  await ScreenUtil.ensureScreenSize();
  final token = LocalServices.prefs?.getString("userToken");
  runApp(Bookia());
}