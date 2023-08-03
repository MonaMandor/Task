//screen contain bottom nav bar
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/shared/cubit/app_cubit_cubit.dart';

import '../moduls/card.dart';
import '../shared/component/custom_navigation_bar.dart';
import 'home_layout.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  List<Widget> screens = [
    HomePage(),
    CardScreen(),
    CardScreen(),
    CardScreen(),
    CardScreen(),
  ];
  int curentIndex = 0;

  void changeIndex(int index) {
    setState(() {
      curentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubitCubit, AppCubitState>(builder: (context, State) {
      var cubit = AppCubitCubit.get(context);

      return Scaffold(
        body: screens[curentIndex],

        //body: Center(child: Text(cubit.curentIndex.toString())),
        bottomNavigationBar: CustomNavigationBar(
          index: curentIndex,
          onTap: changeIndex,
        ),
      );
    });
  }
}
