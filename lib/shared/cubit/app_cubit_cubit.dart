import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/api/_api.dart';
import 'package:posts_app/layouts/home_layout.dart';
import 'package:posts_app/moduls/card.dart';

import '../../models/products.dart';

part 'app_cubit_state.dart';

class AppCubitCubit extends Cubit<AppCubitState> {
  List<Products>? products;
  AppCubitCubit() : super(AppCubitInitial());

  // function to get current screen

  static AppCubitCubit get(context) => BlocProvider.of(context);
  Future<void> gitAllProduct() async {
    emit(GetProductLoading());
    var result = await ProductApi.gitAllProduct();
    products = result;
    print(result!.length);
    emit(GetProductSuccess(result));
  }
}
