import 'package:flutter/material.dart';
import '../const.dart';

class AnswerButton extends StatelessWidget {
  final String answerNumber;

  const AnswerButton({super.key, required this.answerNumber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: colorWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.20),
              blurRadius: 8,
            ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            answerNumber,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
