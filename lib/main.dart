import 'package:ecommerce_app/controller/DioHelper/dio.dart';
import 'package:ecommerce_app/view/Store/bottom_nav_cubit.dart';
import 'package:ecommerce_app/view/Store/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit()..getData(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LayOutScreen(),
      ),
    );
  }
}
