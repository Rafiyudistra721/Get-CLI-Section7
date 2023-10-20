import 'package:flutter/material.dart';
import '../../../home/controllers/home_controller.dart';
import 'package:get/get.dart';


class DropdownCategory extends StatefulWidget {

  const DropdownCategory({super.key});

  @override
  State<DropdownCategory> createState() => _DropdownCategoryState();
}

class _DropdownCategoryState extends State<DropdownCategory> {
  final HomeController products = Get.find();
  final int index = 0;

  List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> dropdownCategory = [
    DropdownMenuItem(value: "Laptop",child: Text(products.allProducts[0].category),),
    DropdownMenuItem(value: "Keyboard",child: Text(products.allProducts[2].category),)
  ];
  return dropdownCategory;
}
String selectedValue = "Laptop";

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
              value: selectedValue,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xff802c6e))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xff802c6e))),
                  filled: true,
                  labelText: "Category"),
                  items: dropdownItems,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
            );
  }
}