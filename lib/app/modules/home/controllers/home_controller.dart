import 'package:get/get.dart';
import '../../../data/product_model.dart';
import '../../../data/service_api.dart';

class HomeController extends GetxController {
  RxList<Product> listProduct = <Product>[].obs;

  final ServiceApi serviceApi = ServiceApi();

  Future<List<Product>> loadProducts() async {
    return listProduct.value = await serviceApi.getProducts();
  }
}
