import 'package:flutter/material.dart';

class Result extends StatelessWidget {
final int resultscore;
final Function resethandler;

Result(this.resultscore,this.resethandler);

String get resultPhrase{
  String resultText;
  if(resultscore == 10){
    resultText ='POOR!,You need improvement!';
  } else if(resultscore  == 20){
    resultText ="GOOD!, Keep improving";
  }else if (resultscore == 30){
    resultText ="EXCELLENT!,Keep it up!";
  }else{
    resultText="FAILED!,better luck next time";
  }
  return resultText;
}



  @override
  Widget build(BuildContext context) {

        return Center(
                  child: Column(
          
          children: [
             Image.network("https://media3.giphy.com/media/h5vCZ5J3EJBQ7IkvO9/source.gif",height: 230,width: 230,),
             SizedBox(height: 0,),
             Text(
               resultPhrase,
               style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.deepPurpleAccent),
             ),
              SizedBox(height: 40,),
               Text(
               'INFERENCE',
               style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),
             ),
               Divider(
              color: Colors.black
            ),
             Text(
               'SCORE AND REMARKS ACCORDINGLY',
               style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),
             ),
              Divider(
              color: Colors.black
            ),
              SizedBox(height: 10,),
             Text(
               'SCORE=30 means EXCELLENT',
               style: TextStyle(fontSize: 23,color:Colors.green,fontWeight: FontWeight.bold),
             ),
         
             Text(
               'SCORE=20 means GOOD',
               style: TextStyle(fontSize: 20,color:Colors.redAccent[100]),
             ),
             Text(
               'SCORE=10 means POOR',
               style: TextStyle(fontSize: 20,color:Colors.redAccent),
             ),
             Text(
               'SCORE=0 means FAILED',
               style: TextStyle(fontSize: 20,color:Colors.redAccent[700]),
             ),
             SizedBox(height: 10,),
              Divider(
              color: Colors.black
            ),
            SizedBox(height: 10,),
            RaisedButton(
        color: Colors.blue[200],
        textColor: Colors.black,
        child: Text('Retake Quiz!'),
        onPressed: resethandler,
      ),
      
    ],
    ),
        );
   
  }
}




// Image.network("https://acegif.com/wp-content/uploads/gif-good-job-81.gif"),
      