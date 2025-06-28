import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordsmith/sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wordsmith',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          primary: const Color.fromARGB(255, 255, 255, 255),
          surface: const Color.fromARGB(255, 0, 0, 0),
          seedColor: Colors.black,
          brightness: Brightness.dark,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionColor: Colors.black12,
          selectionHandleColor: Colors.black,
        ),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          // ···
          titleLarge: GoogleFonts.anton(
            fontWeight: FontWeight.w100,
            fontSize: 30,
            fontStyle: FontStyle.normal,
          ),
          titleMedium: GoogleFonts.urbanist(
            fontWeight: FontWeight.w200,
            fontSize: 24,
            fontStyle: FontStyle.normal,
          ),
          titleSmall: GoogleFonts.pacifico(
            fontWeight: FontWeight.w200,
            fontSize: 24,
            fontStyle: FontStyle.normal,
          ),
          bodyLarge: GoogleFonts.urbanist(
              color: const Color.fromRGBO(213, 13, 13, 0.898),
              fontSize: 20,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic),
          bodyMedium: GoogleFonts.urbanist(),
          bodySmall: GoogleFonts.urbanist(
              color: Colors.black54,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
      home: const SignIn(),
    );
  }
}
