import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quick_math/utils/answer_button.dart';
import 'lose_page.dart';
import 'utils/const.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int playerScore = 0;
  final int timeBase = 10;
  late int _num1;
  late int _num2;
  late int _timeLeft;
  late List<String> _answers = [];

  double _percent = 0.0;
  late Timer _timer;

  _GamePageState() {
    generateNewQuestion(true);
  }

  _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 1000), (_) {
      setState(() {
        _percent += 10;
        _timeLeft -= 1;
        if (_percent >= 100) {
          _timeLeft = 10;
          _percent = 0.0;
          _timer.cancel();
          final route = MaterialPageRoute(
            builder: (context) =>
                LosePage(score: playerScore, text: 'TIMEOUT!'),
          );
          Navigator.pushAndRemoveUntil(context, route, (route) => false);
        }
      });
    });
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
        _timeLeft = timeBase;
        _startTimer();
      });
    } else {
      _num1 = num1;
      _num2 = num2;
      _answers = answers;
      _timeLeft = timeBase;
      _startTimer();
    }
  }

  void answerQuestion(String answer) {
    if (int.parse(answer) == (_num1 + _num2)) {
      setState(() {
        playerScore += 10;
        _percent = 0.0;
        _timeLeft = 0;
        _timer.cancel();
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
            text: 'INCORRECT!',
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
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 0),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      child: Text(
                        'SCORE : $playerScore',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: CircularPercentIndicator(
                      circularStrokeCap: CircularStrokeCap.round,
                      percent: _percent / 100,
                      animation: true,
                      animateFromLastPercent: true,
                      radius: 30.0,
                      lineWidth: 10.0,
                      progressColor: colorWhite,
                      backgroundColor: colorLightGrey,
                      center: Text(
                        _timeLeft.toString(),
                        style: const TextStyle(
                          color: colorGrey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  )
                ],
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
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    ));
  }
}
