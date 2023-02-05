import 'package:ecommerce_app/view/Store/bottom_nav_cubit.dart';
import 'package:ecommerce_app/view/components/Navigetor.dart';
import 'package:ecommerce_app/view/screens/search_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LayOutScreen extends StatelessWidget {
  const LayOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavCubit, BottomNavStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BottomNavCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white38,
            elevation: 0.0,
            title: const Text(
              'Store App',
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  NavPush(context, const SearchScreen());
                },
                icon: const Icon(Icons.search),
                color: Colors.black,
              )
            ],
          ),
          body: cubit.Screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              cubit.changeBottom(index);
            },
            currentIndex: cubit.currentIndex,
            items:  const[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.apps_outlined), label: 'Categore'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border), label: 'Favorite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
        );
      },
    );
  }
}
