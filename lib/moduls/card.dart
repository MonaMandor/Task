import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/shared/constans/context_extentions.dart';
import 'package:posts_app/shared/cubit/cubit/cart_cubit.dart';

import '../shared/component/custom_form_filed.dart';
import '../shared/component/custom_navigation_bar.dart';

class CardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = CartCubit.get(context);
    cubit.getProductsFromDB();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'My Card',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${cubit.cartItems.length}  items in your cart',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle "See All" text click
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
              var cubit = CartCubit.get(context);
              return ListView.builder(
                itemCount: cubit.cartItems.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = cubit.cartItems[index];
                  return Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2.0,
                          blurRadius: 4.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Container(
                        width: context.propWidth(60),
                        height: context.propHeight(60),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(item.product
                                .imageUrl!), // Replace with actual image
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        item.product.title!,
                        style: TextStyle(fontSize: 16.0),
                      ),
                      subtitle: Text(
                        '\$${item.product.price}',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.blue,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              cubit.decreaseQuantity(item.product.id);
                            },
                          ),
                          Text(item.quantity.toString()),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              cubit.addProduct(item.product);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          GestureDetector(
            onTap: () {
              // Handle "Add More Items" text click
            },
            child: Padding(
              padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add More Items',
                    style: TextStyle(
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ),
          Container(
            height: 1.0,
            color: Colors.grey[300],
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Promo Code',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8.0),
                CustomTextField(
                  labelText: 'Enter Promo Code',
                  hintText: 'Enter Promo Code',
                  width: context.propWidth(500),
                  validator: (value, errorText) {
                    if (value!.isEmpty) {
                      return 'Please enter promo code';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal: ',
                  style: TextStyle(fontSize: 16.0),
                ),
                BlocBuilder<CartCubit, CartState>(builder: (context, state) {
                  return Text(
                    cubit.totalPrice.call().toString(),
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.blue,
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
