// ignore_for_file: sized_box_for_whitespace, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoobeta/views/cart.dart';
import 'package:zoobeta/views/own_ticket.dart';
import 'package:zoobeta/views/ticket.dart';
// import 'package:zoobeta/views/ticket.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<String> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username') ?? '';
  }

  final PageController pageController = PageController();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 178, 200, 186),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  padding: const EdgeInsets.all(16.0),
                  color: const Color(0xff90ae9b),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FutureBuilder(
                            future: getUsername(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else {
                                return Text('Welcome, ${snapshot.data}!',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold));
                              }
                            },
                          ),
                          const CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Color.fromARGB(255, 178, 200, 186),
                            backgroundImage: AssetImage('images/profile.png'),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Zoopedia is an application powered by zoo!',
                                style: Theme.of(context).textTheme.subtitle1),
                            Text(
                                'as a platform for information and online ticket purchases',
                                style: Theme.of(context).textTheme.subtitle1),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Ikon Ticket Shop
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              navigatorKey.currentState?.push(
                                MaterialPageRoute(
                                    builder: (context) => const FavoriteList()),
                              );
                            },
                            child: Image.asset(
                              'images/shop.png',
                              width: 60.0,
                              height: 60.0,
                            ),
                          ),
                          const Text('Ticket Shop',
                              style: TextStyle(fontSize: 16.0)),
                        ],
                      ),

                      // Ikon My Cart
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              navigatorKey.currentState?.push(
                                MaterialPageRoute(
                                    builder: (context) => const FavoritePage()),
                              );
                            },
                            child: Image.asset(
                              'images/cart.png',
                              width: 60.0,
                              height: 60.0,
                            ),
                          ),
                          const Text('My Cart',
                              style: TextStyle(fontSize: 16.0)),
                        ],
                      ),

                      // Ikon My Ticket
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              navigatorKey.currentState?.push(
                                MaterialPageRoute(
                                    builder: (context) => MyTicket()),
                              );
                            },
                            child: Image.asset(
                              'images/ticket.png',
                              width: 60.0,
                              height: 60.0,
                            ),
                          ),
                          const Text('My Ticket',
                              style: TextStyle(fontSize: 16.0)),
                        ],
                      ),
                    ],
                  ),
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      // Kolom Gambar
                      Column(
                        children: [
                          Container(
                            width: 350,
                            height: 250,
                            child: PageView(
                              controller: pageController,
                              children: [
                                // Gambar 1
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xff90ae9b),
                                    borderRadius: BorderRadius.circular(12.0),
                                    image: const DecorationImage(
                                      image: AssetImage('images/slide_1.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                // Gambar 2
                                Container(
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff90ae9b),
                                    borderRadius: BorderRadius.circular(12.0),
                                    image: const DecorationImage(
                                      image: AssetImage('images/slide_2.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                // Gambar 3
                                Container(
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff90ae9b),
                                    borderRadius: BorderRadius.circular(12.0),
                                    image: const DecorationImage(
                                      image: AssetImage('images/slide_3.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Tombol geser
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_back),
                                  onPressed: () {
                                    pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.ease,
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.arrow_forward),
                                  onPressed: () {
                                    pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.ease,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
