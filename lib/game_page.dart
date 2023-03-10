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
  List<String> answers = ['10', '25', '30'];
  String correctAnswer = '25';
  String question = '10 + 15 = ?';

  void generateNewQuestion() {
    int num1 = Random().nextInt(10) + 1;
    int num2 = Random().nextInt(10) + 1;
    correctAnswer = '${num1 + num2}';
    question = '$num1 + $num2 = ?';
    answers = [];
    answers.add(correctAnswer);
    answers.add('${(Random().nextInt(10) + 1)}');
    answers.add('${(Random().nextInt(10) + 1)}');
    answers.shuffle();
  }

  void answerQuestion(String answer) {
    if (answer == correctAnswer) {
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
                      Text(
                        'CORRECT!!',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        "assets/images/correct.png",
                        width: 45,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () => {},
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
    }
  }

  void nextQuestion() {
    Navigator.pop(context);
    generateNewQuestion();
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
                    question,
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
                    answerNumber: answers[index],
                    onTap: () => answerQuestion(answers[index]),
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
