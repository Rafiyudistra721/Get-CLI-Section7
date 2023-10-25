
import 'package:flutter/material.dart';
// import '../../controllers/form_controller.dart';

class DropdownCategory extends StatefulWidget {
  const DropdownCategory({super.key});

  @override
  State<DropdownCategory> createState() => _DropdownCategoryState();
}

class _DropdownCategoryState extends State<DropdownCategory> {
  String? dropdownvalue;

List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "Electronics", child: Text("Electronics")),
    const DropdownMenuItem(value: "jewelery", child: Text("jewelery")),
    const DropdownMenuItem(value: "men's clothing", child: Text("men's clothing")),
    const DropdownMenuItem(value: "women's clothing", child: Text("women's clothing")),
  ];
  return menuItems;
}

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
            value: dropdownvalue,
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
            items: dropdownItems,
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          );
    
  }
}
