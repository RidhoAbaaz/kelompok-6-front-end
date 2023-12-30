import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:zoobeta/models/TicketModel.dart';
import 'package:zoobeta/models/cartModel.dart';
import 'package:zoobeta/views/login.dart';
import 'package:zoobeta/views/second.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(create: (context) => FavoriteListModel()),
          ChangeNotifierProxyProvider<FavoriteListModel, FavoritePageModel>(
              create: (context) => FavoritePageModel(),
              update: (context, favoritelist, favoritepage) {
                if (favoritepage == null) {
                  throw ArgumentError.notNull('favoritepage');
                }
                favoritepage.favoritelist = favoritelist;
                return favoritepage;
              })
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: AnimatedSplashScreen(
              splash: const Image(image: AssetImage('images/logo.png')),
              duration: 3000,
              splashTransition: SplashTransition.fadeTransition,
              backgroundColor: const Color.fromARGB(255, 178, 200, 186),
              nextScreen: const LoginPage()),
          initialRoute: '/',
          routes: {'/home': (context) => const SecondMain()},
        ));
  }
}
