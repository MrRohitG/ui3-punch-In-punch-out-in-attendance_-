import 'package:flutter/material.dart';
import 'package:ui3/attend1.dart';
import 'package:ui3/attend1_optimised.dart';
import 'package:ui3/homedashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AttedOptimised1(),
    );
  }
}
