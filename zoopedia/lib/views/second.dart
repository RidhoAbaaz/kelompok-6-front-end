import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:get/get.dart';
import 'package:zoobeta/controllers/button_nav.dart';

class SecondMain extends StatefulWidget {
  const SecondMain({super.key});

  @override
  State<SecondMain> createState() => _SecondMainState();
}

class _SecondMainState extends State<SecondMain> {
  ButtonNav controller = Get.put(ButtonNav());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          bottomNavigationBar: GNav(
              onTabChange: (value) {
                controller.count.value = value;
              },
              padding: const EdgeInsets.all(15),
              gap: 10,
              backgroundColor: Colors.white,
              tabs: const <GButton>[
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.book_online_outlined,
                  text: 'Animals',
                ),
                GButton(
                  icon: Icons.account_circle,
                  text: 'Profile',
                ),
              ]),
          body: Obx(() => controller.pages[controller.count.value])),
    );
  }
}
