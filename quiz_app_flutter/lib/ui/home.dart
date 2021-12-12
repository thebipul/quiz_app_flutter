
import 'package:quiz_app_flutter/model/question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/icon_data.dart';
import 'package:quiz_app_flutter/util/hexcolor.dart';


class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name(
        "The U.S. Declaration of Independence was adopted in 1776.", true),
    Question.name(
        "Freedom of religion means : \nYou can practice any religion,"
        "or not practice a religion.",
        true),
    Question.name(
        "Journalists is one branch or part of the government.", false),
    Question.name("The Congress does not make federal laws.", false),
    Question.name("There are 100 U.S. Senators.", true),
    Question.name("We elect a U.S. Senator for 4 years.", false),
    Question.name("We elect a U.S. Representative for 2 years", true),
    Question.name(
        "A U.S. Senator represents all people of United States", false),
    Question.name("We vote for President in January", false),
    Question.name("Who vetoes bills is the President", true),
    Question.name("The Constitution was written in 1787.", true),
    Question.name('George Bush is the \ "Father of Our Country"\.', false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder:(BuildContext context)=> Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset("images/flag.png", width: 250, height: 180),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.4),
                    border: Border.all(
                        color: Colors.blueGrey.shade400,
                        style: BorderStyle.solid),
                  ),
                  height: 120.0,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(questionBank[_currentQuestionIndex].questionText,style: TextStyle(
                      color:Colors.white,
                    ),),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => _prevQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(true,context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "TRUE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(false,context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "FALSE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _nextQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),

                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if(userChoice == questionBank[_currentQuestionIndex].isCorrect){
      final snackbar =  SnackBar(
        backgroundColor: Colors.green,
          duration: Duration(milliseconds: 500),
          content: Text("Correct!"));
      Scaffold.of(context).showSnackBar(snackbar);
      _updateQuestion();
      //correct answer
      debugPrint("Yes Correct!");
    }else{
      final snackbar =  SnackBar(
        backgroundColor: Colors.red,
          duration: Duration(milliseconds: 500),
          content: Text("Incorrect!"));
      Scaffold.of(context).showSnackBar(snackbar);
      _updateQuestion();
      debugPrint("Incorrect!");
    }
  }
  _updateQuestion(){
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex+1) % questionBank.length;
    });
  }

  _nextQuestion() {
    _updateQuestion();

  }
  _prevQuestion(){
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex -1) % questionBank.length;
      debugPrint("Index: $_currentQuestionIndex");
    });
  }
}
