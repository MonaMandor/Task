import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:posts_app/models/products.dart';

import '../../../models/card_item.dart';
import '../../data/db_helper.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<CartItem> cartItems = [];
  static CartCubit get(context) => BlocProvider.of(context);
  void addProduct(Products product) {
    // check if the product is already in the cart
    if (cartItems.any((element) => element.product.id == product.id)) {
      // if the product is already in the cart, increase the quantity

      cartItems
          .firstWhere((element) => element.product.id == product.id)
          .quantity++;
      DBHelper().increaseQuantity(product.id!);
    } else {
      // if the product is not in the cart, add it
      cartItems.add(CartItem(product: product, quantity: 1));
      DBHelper().insertToDataBase(CartItem(product: product, quantity: 1));
    }

    emit(AddProductToCartState());
  }
  // delete the product from the cart

  void deleteProduct(String? id) {
    cartItems.removeWhere((element) => element.product.id == id);
    DBHelper().deleteProduct(id);
    emit(DeleteProductFromCartState());
  }
  //decrease the quantity of the product in the cart

  void decreaseQuantity(String? id) {
    if (cartItems.firstWhere((element) => element.product.id == id).quantity >
        1) {
      cartItems.firstWhere((element) => element.product.id == id).quantity--;
      DBHelper().decreaseQuantity(id.toString());
    } else {
      deleteProduct(id);
    }
    emit(DecreaseQuantityState());
  }
  // get the products from the database

  void getProductsFromDB() async {
    DBHelper().createDatabase();
    List<CartItem> products = await DBHelper().getDataFromDatabase();
    cartItems = products;
    emit(GetProductsFromDBState());
  }
  //function total price

  double totalPrice() {
    double total = 0;
    cartItems.forEach((element) {
      total += element.total;
    });
    return total;
  }
}
