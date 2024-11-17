import 'package:checkout_ify/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create : (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child :  MaterialApp(
      title: 'Checkoutify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green,
          ).copyWith(secondary: Colors.greenAccent),
          useMaterial3: true,
          fontFamily: "Poppins"
      ),
      home: const LoginPage(),
      ),
    );
  }
}


