// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli_app/app/data/product_model.dart';
import 'widgets/text_fields.dart';
import '../controllers/form_controller.dart';
import 'widgets/image_picker.dart';
import '../../../style/button_style.dart';

class FormView extends GetView<FormController> {
  final formKey = GlobalKey<FormState>();
  Product product = Get.arguments ?? Product();
  @override
  Widget build(BuildContext context) {
    controller.modelToController(product);
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
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Expanded(child: ImagesPicker()),
              const TextFields(),
              ElevatedButton.icon(
                onPressed: () async {
                  formKey.currentState!.validate() == true
                  ? await controller.storeProduct(
                    product, (product.id != null) ? true : false)
                    : Get.snackbar('Error', 'Data Invalid');
                },
                icon: const Icon(Icons.check_circle),
                label: const Text("Confirm"),
                style: buttonPrimary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
