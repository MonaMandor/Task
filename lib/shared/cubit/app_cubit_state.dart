part of 'app_cubit_cubit.dart';

@immutable
abstract class AppCubitState {}

class AppCubitInitial extends AppCubitState {}

class GetProductLoading extends AppCubitState {}

class GetProductSuccess extends AppCubitState {
  final List<Products> products;
  GetProductSuccess(this.products);
}

class CubitChangeBottomNavState extends AppCubitState {}
