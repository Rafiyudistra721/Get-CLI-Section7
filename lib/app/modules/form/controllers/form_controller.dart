// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:get_cli_app/app/data/product_model.dart';
import '../../../data/service_api.dart';
import 'package:flutter/material.dart';

class FormController extends GetxController {
  ServiceApi serviceApi = ServiceApi();

  TextEditingController titleC = TextEditingController();
  TextEditingController priceC = TextEditingController();
  TextEditingController descC = TextEditingController();

  var dropdownvalue = ''.obs;
  void setSelectedValue(String value) {
    dropdownvalue.value = value;
  }

  bool checkIsDouble(String? text) {
    try {
      double.parse(text ?? '');
      return true;
    } catch (e) {
      return false;
    }
  }

  modelToController(Product product) {
    titleC.text = product.title ?? '';
    priceC.text = (product.price ?? '').toString();
    descC.text = product.description ?? '';
    dropdownvalue.value = product.category?? '';
    
  }

  controllerToModel(Product product) {
    product.title = titleC.text;
    product.price = double.tryParse(priceC.text);
    product.description = descC.text;
    product.category = dropdownvalue.value;
    return product;
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
