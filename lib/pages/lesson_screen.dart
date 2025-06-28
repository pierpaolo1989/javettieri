import 'package:flutter/material.dart';
import 'package:javettieri/models/lesson.dart';

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
