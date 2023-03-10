import 'package:flutter/material.dart';

class LosePage extends StatelessWidget {
  const LosePage({super.key, required score});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Image.asset('assets/images/lose.png')
          ],
        ),
      ),
    );
  }
}
