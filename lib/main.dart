import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/moduls/registration_screen.dart';
import 'package:posts_app/shared/cubit/app_cubit_cubit.dart';
import 'package:posts_app/shared/cubit/cubit/cart_cubit.dart';

import 'layouts/home_layout.dart';
import 'moduls/card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubitCubit()),
        BlocProvider(create: (context) => CartCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RegistrationScreen(),
      ),
    );
  }
}
