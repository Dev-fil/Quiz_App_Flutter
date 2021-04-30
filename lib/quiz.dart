import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';



class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
     return Column(
          children: [
            SizedBox(height: 30),
             Image.network("https://media3.giphy.com/media/h5vCZ5J3EJBQ7IkvO9/source.gif",height: 230,width: 600,),
            SizedBox(height: 20),
            Question(
              questions[questionIndex]['questionText'],
            ),
            ...(questions[questionIndex]['answers'] as List<Map<String,Object>>)
                .map((answer) {
              return Answer(()=>answerQuestion(answer['score']), answer['text']);
            }).toList()
      ],
    );
  }
}
