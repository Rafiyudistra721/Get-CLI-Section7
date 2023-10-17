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
          width: 250,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: TextField(
            autocorrect: false,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                labelText: "Cari Produk",
                hintText: "Ketik Produk yang anda inginkan"),
          ),
        ),
        OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.filter_alt),
            label: const Text("Filter"))
      ],
    );
  }
}
