

import 'package:bookia_application/core/helper/local_services.dart';
import 'package:flutter/material.dart';
import 'bookia.dart';

void main ()async{

  WidgetsFlutterBinding.ensureInitialized();
  await LocalServices.init();
  runApp(Bookia());
}