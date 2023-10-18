import 'package:flutter/material.dart';
import '../../../../data/product_model.dart';

class DaftarBarang extends StatelessWidget {
  const DaftarBarang({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 510,
      child: GridView.builder(
        itemCount: 14,
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 0.7),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              
            },
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Image.network(product.image),
                      ),
                      Text(product.title, overflow: TextOverflow.ellipsis),
                      Text(
                        product.description,
                        style: TextStyle(fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text( r"$""${product.price}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis
                        ),
          
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
