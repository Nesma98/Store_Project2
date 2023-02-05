import 'dart:math';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/model/home_model.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://fakestoreapi.com/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

 //  static  getData({
 //    required String url,
 //    Map<String, dynamic>? query,
 //    String lang = 'en',
 //    String? token,
 //  }) async {
 //    dio.options.headers = {
 //      'lang': lang,
 //      'Content-Type': 'application/json',
 //      'Authorization': token,
 //    };
 //    Response response = await dio.get(url, queryParameters: query);
 //
 //      List ResponseList = response.data;
 //    List<HomeModel> product = ResponseList.map((e) {
 //      return HomeModel.fromJson(e);
 //    }).toList();
 // // print(product.length.toString());
 //  //  print(response.data.toString());
 //    return product;
 //
 //  }

static  List<HomeModel> ?product;
  static  getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    Response response = await dio.get(url, queryParameters: query);

    List ResponseList = response.data;
    product = ResponseList.map((e) {
      return HomeModel.fromJson(e);
    }).toList();
    // print(product.length.toString());
    //  print(response.data.toString());
    return product;

  }
}
