import 'package:app/screen/handphone.dart';
import 'package:flutter/material.dart';
//import 'package:app/screen/attandance_recap_screen.dart';
//import 'package:app/screen/dashboard_screen.dart';
//import 'package:app/screen/login_screen.dart';
import 'package:app/screen/splash_screen.dart';
import 'package:app/screen/beranda_elektronik.dart';
import 'package:app/screen/handphone.dart';
import 'package:app/screen/edit.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Presensi App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),//SplashScreen
    );
  }
}
