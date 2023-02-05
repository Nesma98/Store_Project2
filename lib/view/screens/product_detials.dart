import 'package:ecommerce_app/model/home_model.dart';
import 'package:ecommerce_app/view/components/Navigetor.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key, required this.model}) : super(key: key);

  HomeModel? model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        elevation: 0.0,
        title: const Text(
          'Product Details',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Image(
              image: NetworkImage(model!.image!),
              height: 240,

            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 200,
                          child: Text(
                            model!.title!,
                            style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            maxLines: 1,
                          )),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        model!.description!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Spacer(),
                      Row(
                        children: [
                          ElevatedButton(
                              onPressed: () {},
                              clipBehavior: Clip.none,
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                                minimumSize: const Size(0, 0),
                                backgroundColor: Colors.white,
                                elevation: 0,
                              ),
                              child: Icon(Icons.favorite,color: Colors.red)
                          ),
                          const SizedBox(
                            width:10.0,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                              clipBehavior: Clip.none,
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 130,vertical: 10),
                                minimumSize: Size(0, 0),
                                backgroundColor: Colors.black,
                                elevation: 0,
                              ),
                            child: const Icon(Icons.shopping_cart)
                          ),

                        ],
                      ),

                      const SizedBox(
                        height:20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
