part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class AddProductToCartState extends CartState {}

class GetProductFromCartState extends CartState {}

class DeleteProductFromCartState extends CartState {}

class DecreaseQuantityState extends CartState {}

class GetProductsFromDBState extends CartState {}
