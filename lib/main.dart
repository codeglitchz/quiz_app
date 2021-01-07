import 'package:flutter/material.dart';
import 'package:quiz_app/result.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  final _questions = const [
    {
      'questionText': 'Entomology is the science that studies?',
      'answers': [
        'Behavior of human beings',
        'Insects',
        'The origin and history of technical and scientific terms',
        'The formation of rocks'
      ],
    },
    {
      'questionText': 'Hitler party which came into power in 1933 is known as?',
      'answers': [
        'Labour Party',
        'Nazi Party',
        'Ku-Klux-Klan',
        'Democratic Party'
      ],
    },
    {
      'questionText': 'FFC stands for?',
      'answers': [
        'Foreign Finance Corporation',
        'Film Finance Corporation',
        'Federation of Football Council',
        'None of the above'
      ],
    },
    {
      'questionText': 'Fastest shorthand writer was?',
      'answers': [
        'Dr. G. D. Bist',
        'J.R.D. Tata',
        'J.M. Tagore',
        'Khudada Khan'
      ],
    },
    {
      'questionText': 'Epsom (England) is the place associated with?',
      'answers': ['Horse racing', 'Polo', 'Shooting', 'Snooker'],
    },
  ];
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(),
      ),
    );
  }
}
