import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quick_math/utils/answer_button.dart';
import 'const.dart';
import 'lose_page.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int playerScore = 0;
  late int _num1;
  late int _num2;
  late List<String> _answers = [];

  _GamePageState() {
    generateNewQuestion(true);
  }

  void generateNewQuestion(isIntitial) {
    var num1 = Random().nextInt(10) + 1;
    var num2 = Random().nextInt(10) + 1;
    List<String> answers = [];
    answers.add('${num1 + num2}');
    answers.add('${(Random().nextInt(20) + 1)}');
    answers.add('${(Random().nextInt(30) + 1)}');
    answers.shuffle();
    if (!isIntitial) {
      setState(() {
        _num1 = num1;
        _num2 = num2;
        _answers = answers;
      });
    } else {
      _num1 = num1;
      _num2 = num2;
      _answers = answers;
    }
  }

  void answerQuestion(String answer) {
    if (int.parse(answer) == (_num1 + _num2)) {
      setState(() {
        playerScore += 10;
      });

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              height: 110,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'CORRECT!!',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        "assets/images/correct.png",
                        width: 45,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: nextQuestion,
                    child: Container(
                      decoration: BoxDecoration(
                        color: colorGreen,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(
                          left: 37,
                          right: 37,
                          top: 7,
                          bottom: 7,
                        ),
                        child: Text(
                          'NEXT',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: colorWhite,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LosePage(
            score: playerScore,
          );
        },
      ),
    );
  }

  void nextQuestion() {
    Navigator.pop(context);
    generateNewQuestion(false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: colorBackground,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 23, right: 23),
              decoration: BoxDecoration(
                color: colorWhite,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.20),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Text(
                'SCORE : $playerScore',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  SizedBox(
                    height: 129,
                  ),
                  Text(
                    '$_num1 + $_num2 = ?',
                    style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: GridView.builder(
                itemCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return AnswerButton(
                    answerNumber: _answers[index],
                    onTap: () => answerQuestion(_answers[index]),
                  );
                },
              ),
            ),
            Expanded(
              flex: 0,
              child: GestureDetector(
                onTap: () => {Navigator.pop(context)},
                child: Container(
                  decoration: BoxDecoration(
                    color: colorRed,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.20),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 23, right: 23),
                    child: Text(
                      'STOP',
                      style: TextStyle(
                        color: colorWhite,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    ));
  }
}
