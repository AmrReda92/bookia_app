

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bookia.dart';
import 'feature/auth/presentation/cubit/auth_cubit.dart';

void main (){
  runApp(MultiBlocProvider( providers: [
    BlocProvider(create: (_) => AuthCubit()),

  ],
      child: Bookia()));
}