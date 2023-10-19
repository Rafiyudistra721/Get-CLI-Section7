import 'package:flutter/material.dart';
import '../../../home/controllers/home_controller.dart';
import 'package:get/get.dart';

class TextFields extends StatelessWidget {
  final HomeController products = Get.find();

late final int index;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: Card(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            const Text(
              "Informasi Produk",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(

              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xff802c6e))),
                  labelText: "Nama Produk"),
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xff802c6e))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xff802c6e))),
                  filled: true,
                  labelText: "Kategori"),
                  items: products.allProducts[index].category,
                  onChanged: (value) {
                    
                  },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xff802c6e))),
                  labelText: "Harga"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xff802c6e))),
                  labelText: "Deskripsi Produk"),
            ),
          ],
        ),
      ),
    );
  }
}
