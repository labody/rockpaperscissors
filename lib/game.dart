import 'dart:math';

enum Choice { rock, paper, scissors }

Choice? playerChoice;
Choice cpuChoice = getCpuChoice()!;
int playerScore = 0;
int cpuScore = 0;
String? result;

Choice? getCpuChoice() {
  Random random = Random();
  int choiceIndex = random.nextInt(3);
  cpuChoice = Choice.values[choiceIndex];
  // print(cpuChoice.name);
  return cpuChoice;
}

void getResult() {
  if ((playerChoice == Choice.scissors && cpuChoice == Choice.paper) ||
      (playerChoice == Choice.rock && cpuChoice == Choice.scissors) ||
      (playerChoice == Choice.paper && cpuChoice == Choice.rock)) {
    result = 'YOU WON!';
    playerScore++;
  } else if ((playerChoice == Choice.scissors && cpuChoice == Choice.rock) ||
      (playerChoice == Choice.rock && cpuChoice == Choice.paper) ||
      (playerChoice == Choice.paper && cpuChoice == Choice.scissors)) {
    result = 'CPU WON!';
    cpuScore++;
  } else {
    result = "IT'S A DRAW";
  }
}
