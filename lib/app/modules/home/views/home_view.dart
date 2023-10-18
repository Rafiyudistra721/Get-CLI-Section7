import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli_app/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'widgets/Search_bar_Filter_button.dart';
import 'widgets/daftar_barang.dart';
import '../../../style/button_style.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {}, icon: Image.asset('assets/icon/icon.png')),
              const Text(
                'Fake Store',
                style: TextStyle(
                    color: Color(0xff802c6e),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            const SearchAndFilter(),
            const DaftarBarang(),
            const SizedBox(
              height: 10,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
                onPressed: () => Get.toNamed(Routes.FORM),
                label: const Text("Tambah Barang"),
                icon: const Icon(Icons.add_circle_outline),
                style: buttonPrimary,
              ),
            )
          ],
        ));
  }
}
