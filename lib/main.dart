import 'package:flutter/material.dart';
import 'package:places_rating/CreatePlace.dart';
import 'package:places_rating/Favorite.dart';
import 'package:places_rating/Home.dart';
import 'package:places_rating/Landing.dart';
import 'package:places_rating/Places.dart';
import 'package:places_rating/Review.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Places(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes:
      {
        '/': (context) => const Landing(),
        '/home': (context) => const Home(),
        '/favorite': (context) => const Favorite(),
        '/profile': (context) => const Home(),
        '/createPlace':(context)=> CreatePlace(),
        '/review':(context)=> Review(),
      }
    );
  }
}

