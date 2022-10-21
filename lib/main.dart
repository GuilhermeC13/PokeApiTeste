import 'package:flutter/material.dart';
import 'package:poke_api_teste/core/inject/inject.dart';
import 'package:poke_api_teste/features/presentation/pages/home_page.dart';

void main() {
  Inject.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(189, 52, 48, 1),
      ),
      home: const HomePage(),
    );
  }
}
