import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_app/constants';
import 'package:rock_paper_scissors_app/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool userTapped = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            colors: <Color>[
              Color.fromARGB(255, 29, 52, 84),
              Color.fromARGB(255, 23, 31, 64),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70.0, bottom: 15.0),
                  child: Column(
                    children: const [
                      Text('ROCK', style: kGameTitleTextStyle),
                      Text('PAPER', style: kGameTitleTextStyle),
                      Text('SCISSORS', style: kGameTitleTextStyle),
                    ],
                  ),
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          userTapped = true;
                          playerChoice = Choice.rock;
                          getCpuChoice();
                          getResult();
                        });
                        Future.delayed(const Duration(seconds: 6), () {
                          setState(() {
                            userTapped = false;
                          });
                        });
                      },
                      child: Image.asset('images/rock2.png',
                          height: 100.0, width: 100.0),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          userTapped = true;
                          playerChoice = Choice.paper;
                          getCpuChoice();
                          getResult();
                        });
                        Future.delayed(const Duration(seconds: 6), () {
                          setState(() {
                            userTapped = false;
                          });
                        });
                      },
                      child: Image.asset('images/paper2.png',
                          height: 100.0, width: 100.0),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          userTapped = true;
                          playerChoice = Choice.scissors;
                          getCpuChoice();
                          getResult();
                        });
                        Future.delayed(const Duration(seconds: 6), () {
                          setState(() {
                            userTapped = false;
                          });
                        });
                      },
                      child: Image.asset('images/scissors2.png',
                          height: 100.0, width: 100.0),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                // 1. Before user makes a move,
                // 2. Hide CPU's choice and result
                // 3. Display "Make your move" instead
                // 3. i) Option to add an animation of 3 dots to indicate waiting
                // 4. After user makes their move, display CPU's choice and result
                // After some seconds, repeat the cycle again
                Column(
                  children: [
                    userTapped
                        ? const ScoreBoardColumn()
                        : const Text(
                            'Make your move...',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                  ],
                ),

                const SizedBox(height: 50.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'YOU',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            playerScore.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('CPU',
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          Text(
                            cpuScore.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 50.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScoreBoardColumn extends StatelessWidget {
  const ScoreBoardColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            style: const TextStyle(color: Colors.white),
            children: <TextSpan>[
              const TextSpan(
                text: 'CPU chose ',
              ),
              TextSpan(
                text: cpuChoice.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          '$result',
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
