// ignore_for_file: avoid_print

import 'package:get/get.dart';
import '../../../data/product_model.dart';
import '../../../data/service_api.dart';

class DetailController extends GetxController {
  RxList<Product> listProduct = <Product>[].obs;
  ServiceApi serviceApi = ServiceApi();

  Future<Product> getSingleProduct(String id) async{
    return Product() = await serviceApi.getProductById(toString());
  }

  Future<void> deleteProduct(Product product) async {
    try {
      await serviceApi.deleteProduct(product.id.toString());
      Get.snackbar('SUCCESS', 'Product was successfully Deleted');
    } catch (e) {
      print(e);
    }
  }
}
