import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
   
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static final _questions = const [
    {
      'questionText': 'Given equation (x – 2)² + 1 = 2x – 3 is a?',
      'answers': [
        {'text': ' linear equation', 'score': 0},
        {'text': 'quadratic equation', 'score': 10},
        {'text': 'cubic equation', 'score': 0},
        {'text': 'bi-quadratic equation', 'score': 0},
      ],
    },
    {
      'questionText': 'The roots of the equation 7x² + x – 1 = 0 are?',
      'answers': [
        {'text': 'real and distinct', 'score': 10},
        {'text': 'real and equal', 'score': 0},
        {'text': 'not real', 'score': 0},
        {'text': 'None of these', 'score': 0},
      ],
    },
    {
      'questionText': 'Which of the following is not a quadratic equation?',
      'answers': [
        {'text': '  x² + 3x – 5 = 0', 'score': 0},
        {'text': ' x² + x3 + 2 = 0', 'score': 10},
        {'text': ' 3 + x + x² = 0', 'score': 0},
        {'text': ' x² – 9 = 0', 'score': 0},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalscore = 0;

  void _resetquiz() {
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalscore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print("we have more questions!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: AppBar(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            brightness: Brightness.light,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.dehaze_rounded,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            flexibleSpace: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    gradient: LinearGradient(
                        colors: [Colors.blue[400], Colors.green],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight))),
            title: Container(
              padding: EdgeInsets.only(
                left:20
              ),
                          child: Row(

                children:
               [
                Container(
                  padding: EdgeInsets.only(
                    top:30
                  ),
                                  child: Text("Quiz-Panther",
                      style: TextStyle(color: Colors.white, fontSize: 30,fontStyle: FontStyle.italic)),
                ),

                    Container
                    (padding: EdgeInsets.only(
                      top:50
                    ),
                      child: Image.network('https://www.freeiconspng.com/thumbs/study-icon/study-icon-25.png',height: 90,width: 90,))
              ]),
            ),
          ),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalscore, _resetquiz),
      ),
    );
  }
}
