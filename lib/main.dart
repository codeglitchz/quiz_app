import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  final questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': ['Red', 'Orange', 'Blue', 'Green'],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': ['Lion', 'Elephant', 'Zebra', 'Rabbit'],
    },
    {
      'questionText': 'Who\'s your favourite actor?',
      'answers': [
        'Salman Khan',
        'Shahrukh Khan',
        'Ranvir Kapoor',
        'Amitabh Bachchan'
      ],
    },
  ];
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Question(
                    questions[_questionIndex]['questionText'],
                  ),
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text('You did it!'),
              ),
      ),
    );
  }
}
