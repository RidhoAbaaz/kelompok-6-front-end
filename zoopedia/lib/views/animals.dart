import 'package:flutter/material.dart';
import 'package:zoobeta/views/animal_content/amfibi_page.dart';
import 'package:zoobeta/views/animal_content/aves_page.dart';
import 'package:zoobeta/views/animal_content/mamalia_page.dart';
import 'package:zoobeta/views/animal_content/pisces_page.dart';
import 'package:zoobeta/views/animal_content/reptile_page.dart';

class AnimalPage extends StatefulWidget {
  const AnimalPage({super.key});

  @override
  State<AnimalPage> createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFA3CCB0),
        appBar: PreferredSize(
          preferredSize: const Size(300, 120),
          child: AppBar(
            backgroundColor: const Color(0xFF86A789),
            centerTitle: true,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/tracks.png'),
                      fit: BoxFit.fill)),
            ),
          ),
        ),
        body: Center(
            child: Container(
                color: const Color(0xFFA3CCB0),
                height: 500,
                width: 350,
                child: ListView(
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(35, 35, 35, 20),
                        child: Center(
                            child: Container(
                                width: 300,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30)),
                                child: ElevatedButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Color(0xFF86A789))),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const MamaliaPage()));
                                    },
                                    child: const Text('Mamalia (Mammals)',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18)))))),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(35, 10, 35, 20),
                        child: Center(
                            child: Container(
                                width: 300,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30)),
                                child: ElevatedButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Color(0xFF86A789))),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const AvesPage()));
                                    },
                                    child: const Text('Aves (Birds)',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18)))))),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(35, 10, 35, 20),
                        child: Center(
                            child: Container(
                                width: 300,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30)),
                                child: ElevatedButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Color(0xFF86A789))),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const ReptilePage()));
                                    },
                                    child: const Text('Reptil (Reptiles)',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18)))))),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(35, 10, 35, 20),
                        child: Center(
                            child: Container(
                                width: 300,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30)),
                                child: ElevatedButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Color(0xFF86A789))),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const AmphibiaPage()));
                                    },
                                    child: const Text('Amphibia (Amphibians)',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18)))))),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(35, 10, 35, 20),
                        child: Center(
                            child: Container(
                                width: 300,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30)),
                                child: ElevatedButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Color(0xFF86A789))),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const PiscesPage()));
                                    },
                                    child: const Text('Pisces (Fish)',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18)))))),
                  ],
                ))));
  }
}
