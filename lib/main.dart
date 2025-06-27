import 'package:flutter/material.dart';

void main() {
  runApp(JavettieriApp());
}

class JavettieriApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Javettieri',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class Lesson {
  final String title;
  final String content;
  bool isRead;

  Lesson({required this.title, required this.content, this.isRead = false});
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Lesson> lessons = [
    Lesson(title: 'Variabili in Java', content: 'Contenuto su variabili...'),
    Lesson(title: 'Cicli for e while', content: 'Contenuto sui cicli...'),
    Lesson(title: 'Classi e Oggetti', content: 'Contenuto su OOP...'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Javettieri')),
      body: ListView.builder(
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          final lesson = lessons[index];
          return ListTile(
            title: Text(lesson.title),
            subtitle: Text(lesson.isRead ? 'Letta' : 'Da leggere'),
            trailing: Icon(
              lesson.isRead ? Icons.check_box : Icons.check_box_outline_blank,
              color: lesson.isRead ? Colors.green : null,
            ),
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LessonScreen(lesson: lesson),
                ),
              );
              if (result != null) {
                setState(() {
                  lessons[index].isRead = result;
                });
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.quiz),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QuizScreen()),
        ),
      ),
    );
  }
}

class LessonScreen extends StatefulWidget {
  final Lesson lesson;

  LessonScreen({required this.lesson});

  @override
  _LessonScreenState createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late bool isRead;

  @override
  void initState() {
    super.initState();
    isRead = widget.lesson.isRead;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.lesson.title)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.lesson.content),
            SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: isRead,
                  onChanged: (val) {
                    setState(() => isRead = val ?? false);
                  },
                ),
                Text('Segna come letta'),
              ],
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, isRead),
              child: Text('Salva'),
            )
          ],
        ),
      ),
    );
  }
}

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
      appBar: AppBar(title: Text('Quiz Javettieri')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: questionIndex < questions.length
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(questions[questionIndex]['question'] as String,
                      style: TextStyle(fontSize: 20)),
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
                    style: TextStyle(fontSize: 24)),
              ),
      ),
    );
  }
}
