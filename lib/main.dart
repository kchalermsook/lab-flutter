import 'package:flutter/material.dart';
import './question.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _onPressTomHank() {
    print('This is Tom Hank');

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('Index = $_questionIndex');
  }

  @override
  Widget build(BuildContext context) {
    var questions = ['Who is your daddy?', 'Who is your mom?'];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: <Widget>[
            Question(questions[_questionIndex]),
            RaisedButton(
              child: Text('Justin Bieber'),
              onPressed: () => print('I am clicking Justin Bieber'),
            ),
            RaisedButton(
              child: Text('Bruce Willis '),
              onPressed: () {
                print('Bruce Willis is my dad');
              },
            ),
            RaisedButton(
              child: Text('Tom Hank'),
              onPressed: _onPressTomHank,
            ),
            RaisedButton(
              child: Text('Nicolas Cage'),
              onPressed: () => print("Click Nicolas Cage"),
            ),
          ],
        ),
      ),
    );
  }
}
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Text('ssss')
//     );
//   }
// }
