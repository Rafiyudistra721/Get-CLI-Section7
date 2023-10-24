// ignore_for_file: avoid_print

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_cli_app/app/data/product_model.dart';
import '../../../data/service_api.dart';

class FormController extends GetxController {
  ServiceApi serviceApi = ServiceApi();

  TextEditingController imageC = TextEditingController();
  TextEditingController titleC = TextEditingController();
  TextEditingController priceC = TextEditingController();
  TextEditingController descC = TextEditingController();

  bool checkIsDouble(String? text) {
    try {
      double.parse(text ?? '');
      return true;
    } catch (e) {
      return false;
    }
  }

  modelToController(Product product) {
    imageC.text = product.image ?? '';
    titleC.text = product.title ?? '';
    priceC.text = (product.price ?? '').toString();
    descC.text = product.description ?? '';

  }

  controllerToModel(Product product) {
    product.image = imageC.text;
    product.title = titleC.text;
    product.price = double.tryParse(priceC.text);
    product.description = descC.text;

  }

  Future storeProduct(Product product, bool isUpdate) async {
    try {
      product = controllerToModel(product);
      isUpdate == false
          ? await serviceApi.createProduct(product)
          : await serviceApi.updateProduct(product);
      Get.back();
      Get.snackbar("SUCCESS", "Product has been saved");
    } catch (e) {
      print(e.toString());
    }
  }
}
