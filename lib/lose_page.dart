import 'package:flutter/material.dart';
import 'package:quick_math/utils/action_button.dart';
import 'package:quick_math/utils/const.dart';

class LosePage extends StatefulWidget {
  final score;
  final text;
  const LosePage({super.key, required this.score, required this.text});

  @override
  State<LosePage> createState() => _LosePageState();
}

class _LosePageState extends State<LosePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                child: ActionButton(
                  info: 'RESTART',
                  bgColor: colorRed,
                  callBack: () => {
                    Navigator.of(context).pop(),
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
