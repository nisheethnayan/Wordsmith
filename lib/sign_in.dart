import 'package:flutter/material.dart';
import 'package:wordsmith/home_page.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          'lib/assets/images/logo.png',
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
        Card(
          child: FloatingActionButton(
            backgroundColor: Colors.white12,
            child: Text('Sign In with Google'),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(title: 'Wordsmith'),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
