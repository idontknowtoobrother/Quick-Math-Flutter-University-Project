import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quick_math/const.dart';

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
                          Image.asset(
                            'assets/images/logo.png',
                            width: 150,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: colorWhite,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 50,
                                right: 50,
                                top: 8,
                                bottom: 8,
                              ),
                              child: Text(
                                'Quick Math Game',
                                style: TextStyle(
                                    color: colorGrey,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
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
