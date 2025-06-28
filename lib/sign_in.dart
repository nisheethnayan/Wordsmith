import 'package:flutter/material.dart';
import 'package:wordsmith/home_page.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'lib/assets/images/logo.png',
          width: 300,
          height: 280,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 40,
        ),
        IntrinsicWidth(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: const BorderSide(color: Colors.white, width: 2),
            ),
            color: Colors.black12,
            child: GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/assets/images/google.png',
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Sign In with Google',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(title: 'Wordsmith'),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
