import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommerce_app/controller/DioHelper/dio.dart';
import 'package:ecommerce_app/controller/endPoint/end_point.dart';
import 'package:ecommerce_app/model/home_model.dart';
import 'package:ecommerce_app/view/Store/bottom_nav_cubit.dart';
import 'package:ecommerce_app/view/components/Navigetor.dart';
import 'package:ecommerce_app/view/screens/product_detials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavCubit, BottomNavStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BottomNavCubit.get(context);
        return Scaffold(
          body: ConditionalBuilder(
            condition: BottomNavCubit.get(context).homeModel != null,
            builder: (context) => Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount:
                        BottomNavCubit.get(context).homeModel?.length ?? 0,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 44, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 50.0,
                                      color:
                                          Colors.grey.shade600.withOpacity(.1),
                                      spreadRadius: 20,
                                      offset: const Offset(1, 1),
                                    )
                                  ],
                                ),
                                height: 120.0,
                                width: 200,
                              ),
                              Positioned(
                                right: 20,
                                bottom: 70,
                                child: InkWell(
                                  onTap: () {
                                    NavPush(
                                      context,
                                      ProductDetails(
                                        model: cubit.homeModel![index],
                                      ),
                                    );
                                  },
                                  child: Image(
                                    image: NetworkImage(
                                      BottomNavCubit.get(context)
                                              .homeModel?[index]
                                              .image! ??
                                          '',
                                    ),
                                    height: 100,
                                    width: 80,
                                  ),
                                ),
                              ),
                              // const SizedBox(height: 20),
                              Positioned(
                                bottom: 10,
                                left: 10,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      child: Text(
                                        BottomNavCubit.get(context)
                                                .homeModel?[index]
                                                .title ??
                                            '',
                                        maxLines: 1,
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
