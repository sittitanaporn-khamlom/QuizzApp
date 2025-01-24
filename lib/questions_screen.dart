import 'package:flutter/material.dart';
import 'package:myapp/model/quiz_model.dart';

import 'answer_button.dart';
import 'results_screen.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;
  List<String> selectedAnswers = [];

  final List<QuizModel> questions = [
    QuizModel(
      'What are the main building blocks of Flutter UIs?',
      ['Widgets', 'Components', 'Blocks', 'Functions'],
    ),
    QuizModel(
      'How are Flutter UIs built?',
      ['By combining widgets in code', 'By combining widgets in a visual editor', 'By defining widgets in config files', 'By using XCode for iOS and Android Studio for Android'],
    ),
  ];

  void selectAnswer(String answer) {
    setState(() {
      selectedAnswers.add(answer);
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ResultsScreen(selectedAnswers: selectedAnswers),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Questions'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.deepPurple],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    currentQuestion.question,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  ...currentQuestion.answers.map(
                    (answer) => AnswerButton(
                      answer,
                      onPressed: () => selectAnswer(answer),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}