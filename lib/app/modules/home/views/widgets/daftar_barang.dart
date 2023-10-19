// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';

class DaftarBarang extends StatelessWidget {
  final HomeController products = Get.find();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 510,
      child: GridView.builder(
        itemCount: 14,
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 0.7),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              
            },
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Image.network(products.allProducts[index].image),
                      ),
                      Text(products.allProducts[index].title, overflow: TextOverflow.ellipsis),
                      Text(
                        products.allProducts[index].description,
                        style: const TextStyle(fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text( r"$""${products.allProducts[index].price}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis
                        ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(Icons.star_sharp, color: Colors.yellow,),
                          Text("${products.allProducts[index].rating}")
                        ],
                      )
          
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
