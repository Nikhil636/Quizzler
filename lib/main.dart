import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizbrain.dart';

QuizBrain quizBrain = QuizBrain();

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   HomePage createState() => HomePage();
// }

// class HomePage extends State<MyApp> {
//   List<Icon> scorekeeper = [];
//   void checkanswer(bool userpa) {
//     bool answer = quizBrain.getca();
//     setState(() {
//       if (quizBrain.isFinished() == true) {
//         Alert(
//           context: context,
//           title: 'Finished!',
//           desc: 'You\'ve reached the end of the quiz.',
//         ).show();
//         quizBrain.reset();

//         scorekeeper = [];
//       } else {
//         if (userpa == answer) {
//           scorekeeper.add(Icon(
//             Icons.check,
//             color: Colors.green,
//           ));
//         } else {
//           scorekeeper.add(Icon(
//             Icons.close,
//             color: Colors.red,
//           ));
//         }
//         quizBrain.nxt();
//       }
//     });
//   }
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(96, 56, 52, 52),
        appBar: AppBar(
            backgroundColor: Colors.white70,
            title: new Center(
              child: Text(
                'GK QUIZ',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'PlayfairDisplay',
                    fontSize: 35.0,
                    fontWeight: FontWeight.w600),
              ),
            )),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool answer = quizBrain.getca();

    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        quizBrain.reset();

        scoreKeeper = [];
      } else {
        if (userPickedAnswer == answer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nxt();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: <Widget>[
      Container(
          height: 150.00,
          width: 340.0,
          margin: EdgeInsets.only(top: 180.0),
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(border: Border.all(color: Colors.white)),
          child: Center(
              child: Text(
            quizBrain.getqt(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'KdaMThmorPro',
              fontSize: 23.0,
            ),
          ))),
      SizedBox(
        height: 175.0,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Container(
            color: Colors.green,
            height: 80.0,
            width: 140.0,
            child: TextButton(
                style: ButtonStyle(),
                onPressed: () {
                  checkAnswer(true);
                },
                child: Center(
                  child: Text(
                    'TRUE',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontFamily: 'KdaMThmorPro',
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ))),
        SizedBox(
          width: 30.0,
        ),
        Container(
            color: Colors.red,
            height: 80.0,
            width: 140.0,
            child: TextButton(
              style: ButtonStyle(),
              onPressed: () {
                checkAnswer(false);
                quizBrain.isFinished() == true;
              },
              child: Center(
                  child: Text('FALSE',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontFamily: 'KdaMThmorPro',
                        fontWeight: FontWeight.w200,
                      ))),
            ))
      ]),
      SizedBox(
        height: 50.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: scoreKeeper,
      )
    ]));
  }
}
