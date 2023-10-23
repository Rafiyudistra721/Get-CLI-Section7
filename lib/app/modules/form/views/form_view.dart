import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/text_fields.dart';
import '../controllers/form_controller.dart';
import 'widgets/image_picker.dart';
import '../../../style/button_style.dart';
import '../../home/controllers/home_controller.dart';

class FormView extends GetView<FormController> {
  final products = Get.find<HomeController>();
  final _dropdownFormKey = GlobalKey<FormState>();
  FormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Form(
        key: _dropdownFormKey,
        child: Column(
          children: [
            const Flexible(child: ImagesPicker()),
            TextFields(),
            ElevatedButton.icon(
              onPressed: () {
                if (_dropdownFormKey.currentState!.validate()) {
                  
                }
                // return products.addProduct(image, controller.titleC.text, controller.priceC.text, controller.descC.text, category);
              },
              icon: const Icon(Icons.check_circle),
              label: const Text("Confirm"),
              style: buttonPrimary,
            )
          ],
        ),
      ),
    );
  }
}
