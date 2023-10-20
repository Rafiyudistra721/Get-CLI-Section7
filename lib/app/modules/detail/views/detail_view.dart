import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';
import '../../home/controllers/home_controller.dart';

class DetailView extends GetView<DetailController> {
  final int index = 0;
  final products = Get.put(HomeController());
  DetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
                onPressed: () {}, icon: Image.asset('assets/icon/icon.png')),
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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            width: size.width,
            height: 210,
            child: Card(
              child: SizedBox.expand(
                child: FittedBox(
                  child: Image.network(products.allProducts[index].image),
                ),
              ),
            ),

          )
        ],
      )
    );
  }
}
