import 'package:banking/pages/input/input_screen.dart';
import 'package:banking/repositories/app_repository.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  AppRepository.instance.initAppRepo();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuickQRBanking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      home: const InputScreen(),
    );
  }
}
