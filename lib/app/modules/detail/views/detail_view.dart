// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli_app/app/data/product_model.dart';
import 'package:get_cli_app/app/routes/app_pages.dart';

import '../controllers/detail_controller.dart';
import '../../../data/service_api.dart';

class DetailView extends GetView<DetailController> {
  DetailView({Key? key}) : super(key: key);
  Product product = Get.arguments?? Product();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  }, 
                  icon: Image.asset('assets/icon/icon.png')),
              const Text(
                'Fake Store',
                style: TextStyle(
                    color: Color(0xff802c6e),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                width: size.width,
                height: 210,
                child: Card(
                  child: SizedBox.expand(
                    child: FittedBox(
                      child: Image.network(product.image ?? ""),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(product.title ?? ""),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_sharp,
                    color: Colors.yellow[700],
                    size: 20,
                  ),
                  Icon(
                    Icons.star_sharp,
                    color: Colors.yellow[700],
                    size: 20,
                  ),
                  Icon(
                    Icons.star_sharp,
                    color: Colors.yellow[700],
                    size: 20,
                  ),
                  Icon(
                    Icons.star_sharp,
                    color: Colors.yellow[700],
                    size: 20,
                  ),
                  Icon(
                    Icons.star_half_sharp,
                    color: Colors.yellow[700],
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${product.rating?.rate} | ${product.rating?.count}",
                    style: const TextStyle(fontSize: 12),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                r"$" "${product.price}",
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Product Details",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                product.description ?? "",
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                width: 190,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xff802c6e))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.sell_outlined),
                    Text(product.category ?? "")
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    heroTag: 'edit btn',
                    backgroundColor: Colors.yellow[700],
                    onPressed: () {
                      Get.toNamed(Routes.FORM, arguments: product);
                    },
                    child: const Icon(Icons.edit),
                  )),
              const SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    heroTag: 'delete btn',
                    backgroundColor: Colors.red[700],
                    onPressed: () {
                      Get.dialog(
                        Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 110,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 214, 143, 199),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(top: 5, bottom: 10),
                                      child: Icon(
                                        Icons.question_mark_rounded,
                                        size: 90,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 30),
                                    child: const Text(
                                      "Are You Sure?",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 30),
                                    child: const Text(
                                      "Do you really want to delete this product? You will not be able to undo this action!",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  ButtonBar(
                                    alignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            side: const BorderSide(
                                                color: Color(0xff802c6e))),
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text(
                                          "No",
                                          style: TextStyle(
                                              color: Color(0xff802c6e)),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            side: const BorderSide(
                                                color: Color(0xff802c6e))),
                                        onPressed: () {},
                                        child: const Text(
                                          "Yes",
                                          style: TextStyle(
                                              color: Color(0xff802c6e)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: const Icon(Icons.delete),
                  ))
            ],
          ),
        ));
  }
}
