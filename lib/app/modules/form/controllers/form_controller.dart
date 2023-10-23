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
  TextEditingController categoryC = TextEditingController();

  bool checkIsDouble(String? text) {
    try {
      double.parse(text ?? '');
      return true;
    } catch (e) {
      return false;
    }
  }

  modelToController(Product product) {
    // imageC
    titleC.text = product.title ?? '';
    priceC.text = (product.price ?? '').toString();
    descC.text = product.description ?? '';

  }

  controllerToModel(Product product) {
    // product.image = 
    
  }
}
