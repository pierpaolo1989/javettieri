import 'package:flutter/material.dart';
import 'package:javettieri/models/lesson.dart';
import 'package:javettieri/pages/lesson_screen.dart';
import 'package:javettieri/pages/quiz_screen.dart';
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
    Lesson(title: 'Interfacce e classi astratte', content: ''),
    Lesson(title: 'Gestione delle eccezioni', content: ''),
    Lesson(title: 'Collezioni avanzate (ArrayList, HashMap, Set', content: ''),
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
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              title: Text(lesson.title, style: TextStyle(fontSize: 18)),
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
            ),
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
