import 'package:flutter/material.dart';
import 'package:quick_math/game_page.dart';
import 'package:quick_math/home_page.dart';
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
  void restartGame() {
    final route = MaterialPageRoute(
      builder: (context) => GamePage(),
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  void mainMenu() {
    final route = MaterialPageRoute(
      builder: (context) => HomePage(),
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        widget.text,
                        style: const TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                          color: colorRed,
                        ),
                      ),
                      Text(
                        'SCORE : ${widget.score}',
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: colorGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Container(
                  child: ActionButton(
                    info: 'RESTART',
                    bgColor: colorGreen,
                    callBack: restartGame,
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Container(
                  child: ActionButton(
                    info: 'MAIN MENU',
                    bgColor: colorGreen,
                    callBack: mainMenu,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
