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
        {'text': 'Behavior of human beings', 'score': 0},
        {'text': 'Insects', 'score': 1},
        {
          'text': 'The origin and history of technical and scientific terms',
          'score': 0
        },
        {'text': 'The formation of rocks', 'score': 0},
      ],
    },
    {
      'questionText': 'Hitler party which came into power in 1933 is known as?',
      'answers': [
        {'text': 'Labour Party', 'score': 0},
        {'text': 'Nazi Party', 'score': 1},
        {'text': 'Ku-Klux-Klan', 'score': 0},
        {'text': 'Democratic Party', 'score': 0},
      ],
    },
    {
      'questionText': 'FFC stands for?',
      'answers': [
        {'text': 'Foreign Finance Corporation', 'score': 0},
        {'text': 'Film Finance Corporation', 'score': 1},
        {'text': 'Federation of Football Council', 'score': 0},
        {'text': 'None of the above', 'score': 0},
      ],
    },
    {
      'questionText': 'Fastest shorthand writer was?',
      'answers': [
        {'text': 'Dr. G. D. Bist', 'score': 1},
        {'text': 'J.R.D. Tata', 'score': 0},
        {'text': 'J.M. Tagore', 'score': 0},
        {'text': 'Khudada Khan', 'score': 0},
      ],
    },
    {
      'questionText': 'Epsom (England) is the place associated with?',
      'answers': [
        {'text': 'Horse racing', 'score': 1},
        {'text': 'Polo', 'score': 0},
        {'text': 'Shooting', 'score': 0},
        {'text': 'Snooker', 'score': 0},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
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
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
