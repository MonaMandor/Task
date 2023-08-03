import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/shared/constans/context_extentions.dart';
import 'package:posts_app/shared/cubit/cubit/cart_cubit.dart';

import '../shared/component/custom_navigation_bar.dart';
import '../shared/constans/assets_manger.dart';
import '../shared/cubit/app_cubit_cubit.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AppCubitCubit>(context).gitAllProduct();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UserWidget(
                    userPhoto:
                        AssetManger.apple, // Replace with the user's photo
                    userName: 'John Doe', // Replace with the user's name
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications),
                    color: Colors.black,
                    onPressed: () {
                      // Handle notification icon press here
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.waving_hand,
                    color: Colors.black,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Welcome back',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.filter_list),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New Offers',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle "See All" button press for new offers
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  // Replace with the new offer item widget
                  return Container(
                    width: context.propWidth(250),
                    height: context.propHeight(50),
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      image: DecorationImage(
                        image: AssetImage(AssetManger.sales),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        'New Fashions',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: 13, left: 8, top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FashionSectionWidget(
                                title: 'All Shirts', selected: true),
                            FashionSectionWidget(
                                title: 'Crop Tops', selected: false),
                            FashionSectionWidget(
                                title: 'Blazers', selected: false),
                          ],
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle "See All" button press for new fashions
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: BlocBuilder<AppCubitCubit, AppCubitState>(
                  builder: (context, state) {
                if (state is GetProductSuccess)
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          child: Container(
                            child:
                                Image.network(state.products[index].imageUrl!),
                          ),
                          onTap: () {
                            CartCubit.get(context)
                                .addProduct(state.products[index]);
                          });
                    },
                  );
                else
                  return Center(child: CircularProgressIndicator());
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class UserWidget extends StatelessWidget {
  final String userPhoto;
  final String userName;

  UserWidget({required this.userPhoto, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(userPhoto),
        ),
        SizedBox(width: 8.0),
        Text(
          userName,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class FashionSectionWidget extends StatelessWidget {
  final String title;
  final bool selected;

  FashionSectionWidget({required this.title, required this.selected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle fashion section selection
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: selected ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
