import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'category_dropdown.dart';
import '../../controllers/form_controller.dart';

class TextFields extends GetView<FormController> {
  const TextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: Card(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            const Text(
              "Product Information",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              validator: (value) => value == null || value == ''
                  ? 'Product Name is required'
                  : null,
              controller: controller.titleC,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xff802c6e))),
                  labelText: "Product Name"),
            ),
            const SizedBox(
              height: 10,
            ),
            const DropdownCategory(),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (value) => value == null || value == ''
                  ? 'Product Price is required'
                  : controller.checkIsDouble(value) == false
                      ? 'Wrong Value'
                      : null,
              controller: controller.priceC,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xff802c6e))),
                  labelText: "Price"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (value) => value == null || value == ''
                  ? 'Product Description is required'
                  : null,
              controller: controller.descC,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xff802c6e))),
                  labelText: "Product Description"),
            ),
          ],
        ),
      ),
    );
  }
}
