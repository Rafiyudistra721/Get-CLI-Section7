import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli_app/app/modules/form/views/widgets/text_fields.dart';
import '../controllers/form_controller.dart';
import 'widgets/image_picker.dart';
import '../../../style/button_style.dart';

class FormView extends GetView<FormController> {
  const FormView({Key? key}) : super(key: key);
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
          ElevatedButton.icon(onPressed: () {}, 
          icon: const Icon(Icons.check_circle), 
          label: const Text("Selesai"),
          style: buttonPrimary,)
          ],
      ),
    );
  }
}
