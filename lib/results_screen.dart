import 'package:flutter/material.dart';
import 'start_screen.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> selectedAnswers;
  final int correctAnswersCount;
  final int totalQuestions;

  const ResultsScreen({
    super.key,
    required this.selectedAnswers,
    required this.correctAnswersCount,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.deepPurple],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'You answered $correctAnswersCount out of $totalQuestions questions correctly!',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const StartScreen(),
                    ),
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.restart_alt, color: Colors.white),
                label: const Text(
                  'Restart Quiz',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}