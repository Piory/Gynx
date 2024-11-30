import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gynx_core/gynx_core.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF9C6EF1),
      brightness: Brightness.dark,
    );
    return MaterialApp(
      title: 'Gynx',
      theme: ThemeData(
        colorScheme: colorScheme,
        textTheme: GoogleFonts.robotoTextTheme(
          ThemeData.dark().textTheme,
        ),
      ),
      home: const SignInView(),
    );
  }
}
