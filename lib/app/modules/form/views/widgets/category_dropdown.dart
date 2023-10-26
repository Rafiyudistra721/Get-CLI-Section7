// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli_app/app/data/product_model.dart';
import '../../controllers/form_controller.dart';

class DropdownCategory extends GetView<FormController> {
  Product product = Get.arguments ?? Product();

  @override
  Widget build(BuildContext context) {
    controller.modelToController(product);

    final items = [
      "electronics",
      "jewelery",
      "men's clothing",
      "women's clothing"
    ];

    return DropdownButtonFormField(
      isDense: true,
      value: controller.dropdownvalue.value.isNotEmpty
        ? controller.dropdownvalue.value
        : null,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xff802c6e))),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xff802c6e))),
          filled: true,
          labelText: "Category"),
      validator: (value) => value == null ? "Select a Category" : null,
      items: items.map<DropdownMenuItem<String>>((String value){
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value)
          );
      }).toList(),
      onChanged: (String? value) {
        if (value != null) {
          controller.setSelectedValue(value);
        }
      },
    );
  }
}
