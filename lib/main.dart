import 'package:flutter/material.dart';
import 'package:checkout_ify/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkoutify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ).copyWith(secondary: Colors.greenAccent),
        useMaterial3: true,
        fontFamily: "Poppins"
      ),
      home: MyHomePage(),
    );
  }
}


