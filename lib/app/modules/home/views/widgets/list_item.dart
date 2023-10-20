// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';
import '../../../../routes/app_pages.dart';

class DaftarBarang extends StatelessWidget {
  final HomeController products = Get.find();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 510,
      child: Obx(() => GridView.builder(
              itemCount: products.allProducts.length,
              key: UniqueKey(),
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 0.6),
              itemBuilder: (context, index) {
                return GestureDetector(
            onTap: () => Get.toNamed(Routes.DETAIL, arguments: products.allProducts[index]),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 250,
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          
                          child: Image.network(products.allProducts[index].image, fit: BoxFit.cover,),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(products.allProducts[index].title, overflow: TextOverflow.ellipsis),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        products.allProducts[index].description,
                        style: const TextStyle(fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text( r"$""${products.allProducts[index].price}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis
                        ),
                        const SizedBox(
                          width: 35,
                        ),
                          const Icon(Icons.star_sharp, color: Colors.yellow, size: 18,),
                          Text("${products.allProducts[index].rating.rate}", style: const TextStyle(fontSize: 12),)
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
      ),
    );
  }
}
