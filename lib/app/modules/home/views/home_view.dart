import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'widgets/Search_bar_Filter_button.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: Image.asset("assets/icon/icon.png"),),
        title: const Text(
          'Fake Store',
          style: TextStyle(
            color: Color(0xff802c6e), 
            fontFamily: "Poppins", 
            fontWeight: FontWeight.bold
            ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: const Column(
        children: [
          SearchAndFilter(),
        ],
      ) 
    );
  }
}


