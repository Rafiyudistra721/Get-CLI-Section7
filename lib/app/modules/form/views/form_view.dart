import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/text_fields.dart';
import '../controllers/form_controller.dart';
import 'widgets/image_picker.dart';
import '../../../style/button_style.dart';
import '../../home/controllers/home_controller.dart';

class FormView extends GetView<FormController> {
    final products = Get.find<HomeController>();
  FormView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
          const Flexible(child: ImagesPicker()), 
          TextFields(),
          ElevatedButton.icon(onPressed: () {
            // return products.addProduct(image, controller.titleC.text, controller.priceC.text, controller.descC.text, category);
          }, 
          icon: const Icon(Icons.check_circle), 
          label: const Text("Confirm"),
          style: buttonPrimary,)
          ],
      ),
    );
  }
}
