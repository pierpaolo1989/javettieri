import 'package:flutter/material.dart';
import 'package:javettieri/models/lesson.dart';
import 'package:javettieri/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Lesson> lessons = [
    Lesson(title: 'Variabili in Java', content: '''
In Java, una variabile è un contenitore che memorizza dati durante l'esecuzione di un programma. 
Ogni variabile ha un tipo che definisce quali valori può contenere:

Esempio:
int numero = 5;
String nome = "Mario";
boolean attivo = true;

Le variabili devono essere dichiarate prima di essere utilizzate. 
Java è un linguaggio fortemente tipizzato, quindi ogni variabile deve avere un tipo specifico.
'''),
    Lesson(title: 'Cicli for e while', content: '''
I cicli consentono di eseguire ripetutamente un blocco di codice.

**Ciclo for**:
for (int i = 0; i < 5; i++) {
    System.out.println(i);
}

**Ciclo while**:
int i = 0;
while (i < 5) {
    System.out.println(i);
    i++;
}

**Ciclo do-while**:
int i = 0;
do {
    System.out.println(i);
    i++;
} while (i < 5);

Usali per iterazioni con una condizione nota o indeterminata.
'''),
    Lesson(title: 'Classi e Oggetti', content: '''
Java è un linguaggio orientato agli oggetti. Una classe è un modello (template) da cui si creano oggetti.

Esempio di classe:
class Persona {
    String nome;
    int età;

    void saluta() {
        System.out.println("Ciao, mi chiamo " + nome);
    }
}

Creazione di un oggetto:
Persona p = new Persona();
p.nome = "Luca";
p.età = 25;
p.saluta();

Le classi rappresentano concetti, gli oggetti rappresentano istanze concrete.
'''),
    Lesson(title: 'Polimorfismo', content: ''),
    Lesson(title: 'Array e Liste', content: ''),
    Lesson(title: 'Programmazione funzionale', content: ''),
    Lesson(title: 'Input e file', content: ''),
    Lesson(title: 'Thread e programmazione concorrente', content: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Javettieri',
          style: TextStyle(color: AppColors.textPrimary),
        ),
        backgroundColor: AppColors.primary,
      ),
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
        child: const Icon(Icons.quiz),
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.lesson.content),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: isRead,
                  onChanged: (val) {
                    setState(() => isRead = val ?? false);
                  },
                ),
                const Text('Segna come letta'),
              ],
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, isRead),
              child: const Text('Salva'),
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
