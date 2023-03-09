import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quick_math/const.dart';
import 'package:quick_math/game_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorBackground,
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          const SizedBox(height: 19),
                          Image.asset(
                            'assets/images/logo.png',
                            width: 150,
                          ),
                          const SizedBox(height: 19),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: colorWhite,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.20),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Quick Math Game',
                                  style: TextStyle(
                                      color: colorGrey,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 0,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return GamePage();
                            },
                          ),
                        )
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: colorGreen,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.20),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(
                            left: 130,
                            right: 130,
                            top: 8,
                            bottom: 8,
                          ),
                          child: Text(
                            'START',
                            style: TextStyle(
                              color: colorWhite,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Develop by 62160246 and 62160317 ',
                      style: TextStyle(color: colorGrey),
                    ),
                    const SizedBox(
                      height: 5,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
