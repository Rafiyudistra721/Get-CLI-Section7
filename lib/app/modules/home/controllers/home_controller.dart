import 'package:get/get.dart';

class Product {
  String id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
}

class Rating {
  double rate; 
  int count;

  Rating({
    required this.rate,
    required this.count,
  });
}

class HomeController extends GetxController {
  RxList<Product> allProducts = <Product> [
    Product(
      id: DateTime.now().toIso8601String(), 
      title: "MSI Modern 14 i3 (11) C11M 9S7-14J312-244 Black", 
      price: 361.82, 
      description: "Laptop ini dilengkapi dengan fitur Cooler Boost, Hi-Res Audio, Military-Grade Durability, Type-C PD Charging", 
      category: "Laptop", 
      image: "https://cdn1.smartprix.com/rx-i7ZSnyKNa-w1200-h1200/7ZSnyKNa.jpg", 
      rating: Rating(rate: 4.8, count: 34)),
    Product(
      id: DateTime.now().toIso8601String(), 
      title: "Asus Vivo Book i5 (11) A1400EA-VIPS551 - Black", 
      price: 548.15, 
      description: "Laptop ini memiliki spesifikasi intel core i5-1135G7, RAM 8GB DDR4 Upgradeable ", 
      category: "Laptop", 
      image: "https://www.softcom.co.id/wp-content/uploads/2023/01/as2.jpg", 
      rating: Rating(rate: 4.9, count: 21)),
    Product(
      id: DateTime.now().toIso8601String(), 
      title: "Royal Kludge RKH81 RK H81 Mechanical Keyboard Gasket Mount Structure - White Night", 
      price: 51.08, 
      description: "Mechanical Keyboard Merk Royal Kludge dengan varian warna White Night", 
      category: "Keyboard", 
      image: "https://m.media-amazon.com/images/I/61pqTXXaZTL.jpg", 
      rating: Rating(rate: 5, count: 21))
    ].obs; 

    void addProduct(String image, String title, String price, String desc, String category) {
      if (image.isNotEmpty && title.isNotEmpty && price.isNotEmpty && desc.isNotEmpty && category.isNotEmpty){
        allProducts.add(Product(
          id: DateTime.now().toIso8601String(), 
          title: title, 
          price: double.parse(price), 
          description: desc, 
          category: category, 
          image: image, 
          rating: Rating(rate: 0.0, count: 0)
        ));
        Get.back();
      }
    }
}
