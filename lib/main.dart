import 'package:flutter/material.dart';
import 'package:toilet_tales/core/constants/app_routes.dart';
import 'package:toilet_tales/features/home/presentation/home_screen.dart';

void main() {
  runApp(const ToiletTalesApp());
}

class ToiletTalesApp extends StatelessWidget {
  const ToiletTalesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'CartoonFont', // Define a fonte padrão
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold), // Substituto de headline1
          displayMedium: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold), // Substituto de headline2
          bodyLarge: TextStyle(fontSize: 16), // Substituto de bodyText1
          bodyMedium: TextStyle(fontSize: 14), // Substituto de bodyText2
        ),
        primarySwatch: Colors.yellow,
      ),
      home: const HomeScreen(),
    );
  }
}
