import 'package:flutter/material.dart';
import 'package:javettieri/theme/app_colors.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int questionIndex = 0;
  int score = 0;
  List<Map<String, Object>> questions = [
    {
      'question': 'Qual è il tipo di dato per i numeri interi?',
      'options': ['String', 'int', 'double', 'boolean'],
      'answer': 'int'
    },
    {
      'question': 'Cosa stampa System.out.println("Hello");?',
      'options': ['Hello', 'System.out.println', 'Errore', 'Console'],
      'answer': 'Hello'
    },
  ];

  void answerQuestion(String selected) {
    final correct = questions[questionIndex]['answer'];
    if (selected == correct) score++;
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: const Text(
            'Quiz Javettieri',
            style: TextStyle(color: AppColors.textPrimary),
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: questionIndex < questions.length
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(questions[questionIndex]['question'] as String,
                      style: const TextStyle(fontSize: 20)),
                  ...(questions[questionIndex]['options'] as List<String>).map(
                    (option) => ElevatedButton(
                      onPressed: () => answerQuestion(option),
                      child: Text(option),
                    ),
                  ),
                ],
              )
            : Center(
                child: Text('Quiz finito! Punteggio: $score',
                    style: const TextStyle(fontSize: 24)),
              ),
      ),
    );
  }
}
