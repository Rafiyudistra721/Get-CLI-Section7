import 'package:flutter/material.dart';
import '../../../../data/product_model.dart';

class DaftarBarang extends StatelessWidget {
   DaftarBarang({
    super.key,
  });
final Product product = Product(
    id: 1, 
    title: "MSI Modern 14 i3 (11) C11M 9S7-14J312-244 Black", 
    price: 5690000, 
    description: "Modern 14 C11M-244ID-9S7-14J312-244 dengan fitur Cooler Boost, Hi-Res Audio, Military-Grade Durability, Type-C PD Charging", 
    category: "Laptop", 
    image: const NetworkImage("https://images.tokopedia.net/img/cache/900/VqbcmM/2023/10/13/2eb7a15c-7b73-42ad-a704-6a0f12040565.jpg"), 
    rating: Rating(rate: 4.8, count: 34));
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: GridView.builder(
        itemCount: 15,
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Text("${product.image}"),
                Text(product.title, overflow: TextOverflow.ellipsis),
                Text("${product.price}", overflow: TextOverflow.ellipsis),
                Text(product.description, overflow: TextOverflow.ellipsis),
            
              ],
            ),);
        },
      ),
    );
  }
}
