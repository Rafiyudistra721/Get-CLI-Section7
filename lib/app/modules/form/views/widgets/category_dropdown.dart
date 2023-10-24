import 'dart:convert';

import 'package:flutter/material.dart';
// import '../../controllers/form_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class DropdownCategory extends StatefulWidget {
  const DropdownCategory({super.key});

  @override
  State<DropdownCategory> createState() => _DropdownCategoryState();
}

class _DropdownCategoryState extends State<DropdownCategory> {
  String? dropdownvalue;

  Future<List<String>> getAllCategory() async {
    var baseUrl = "https://fakestoreapi.com/products/categories";

    http.Response response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<String> category = [];
      var jsonData = jsonDecode(response.body) as List;
      for (var element in jsonData) {
        category.add(element["ClassName"]);
      }
      return category;
    } else {
      throw response.statusCode;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<String>>(
      future: getAllCategory(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!;
          return DropdownButtonFormField(
            value: dropdownvalue ?? data[0],
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
            items: data.map((String category) {
              return DropdownMenuItem(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    ));
  }
}
