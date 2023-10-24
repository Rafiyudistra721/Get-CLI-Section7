// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';
import '../../../../routes/app_pages.dart';

class DaftarBarang extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 510,
        child: FutureBuilder(
            future: controller.loadProducts(),
            builder: (context, snapshot) => snapshot.connectionState ==
                    ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : Container(
                    height: Get.height * 0.8,
                    child: GridView.builder(
                      itemCount: controller.listProduct.length,
                      key: UniqueKey(),
                      padding: const EdgeInsets.all(10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                              childAspectRatio: 0.4),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Get.toNamed(Routes.DETAIL,
                              arguments: controller.listProduct[index]),
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 200,
                                      width: 450,
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Image.network(
                                          controller.listProduct[index].image ??
                                              "",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        controller.listProduct[index].title ??
                                            "",
                                        overflow: TextOverflow.ellipsis),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      controller
                                              .listProduct[index].description ??
                                          "",
                                      style: const TextStyle(fontSize: 10),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            r"$"
                                            "${controller.listProduct[index].price}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.ellipsis),
                                        const SizedBox(
                                          width: 35,
                                        ),
                                        const Icon(
                                          Icons.star_sharp,
                                          color: Colors.yellow,
                                          size: 18,
                                        ),
                                        Text(
                                          "${controller.listProduct[index].rating?.rate}",
                                          style: const TextStyle(fontSize: 12),
                                        )
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
                  )));
  }
}
