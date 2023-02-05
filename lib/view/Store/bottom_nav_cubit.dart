import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/controller/DioHelper/dio.dart';
import 'package:ecommerce_app/controller/endPoint/end_point.dart';
import 'package:ecommerce_app/model/home_model.dart';
import 'package:ecommerce_app/view/components/constance/const.dart';
import 'package:ecommerce_app/view/screens/category_screen.dart';
import 'package:ecommerce_app/view/screens/favorites_screen.dart';
import 'package:ecommerce_app/view/screens/home_screen.dart';
import 'package:ecommerce_app/view/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavStates> {
  BottomNavCubit() : super(BottomNavInitialStates());

  static BottomNavCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> Screens = const [
    HomeScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];
  changeBottom(index) {
    currentIndex = index;
    emit(BottomNavChangeStates());
  }

  List<HomeModel>? homeModel;
  getData() async {
    emit(StoreLoadingStates());
    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) async {
      homeModel = await DioHelper.product;
      emit(StoreSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(StoreErrorStates());
    });
  }
}
