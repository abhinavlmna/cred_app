import 'package:flutter/material.dart';

class Donepage extends StatelessWidget {
  const Donepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'Done',
        style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.purpleAccent),
      )),
    );
  }
}
