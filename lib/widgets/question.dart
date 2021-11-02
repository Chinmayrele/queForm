import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // const Question({Key? key}) : super(key: key);
  final String question;
  const Question(this.question);

  @override
  Widget build(BuildContext context) {
    return Text(
      question,
      style: const TextStyle(
        backgroundColor: Colors.blueAccent,
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
