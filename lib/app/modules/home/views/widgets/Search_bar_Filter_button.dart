// ignore_for_file: file_names
import 'package:flutter/material.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 1100,
          padding: EdgeInsets.symmetric(horizontal: 29, vertical: 20),
          child: TextField(
            autocorrect: false,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                labelText: "Cari Produk",
                hintText: "Ketik Produk yang anda inginkan"),
          ),
        ),
        ElevatedButton.icon(
          style: ButtonStyle(
          ),
          onPressed: () {},
          icon: const Icon(
            Icons.filter_alt,
            size: 20,
          ),
          label: const Text("Filter"),
        )
      ],
    );
  }
}
