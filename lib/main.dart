import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: WordBook()
    );
  }
}

class WordBook extends StatelessWidget {

  final List wordList = [
    { 'word': 'experience', 'answer': '経験' },
    { 'word': 'talk', 'answer': '話す' },
    { 'word': 'soup', 'answer': 'スープ' },
    { 'word': 'study', 'answer': '勉強する' },
    { 'word': 'pillow', 'answer': '枕' },
    { 'word': 'bag', 'answer': 'カバン' },
    { 'word': 'stay', 'answer': '留まる' },
    { 'word': 'pen', 'answer': 'ペン' },
    { 'word': 'majestic', 'answer': '荘厳' },
    { 'word': 'curiosity', 'answer': '好奇心' },
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ToggleAnswer(),
      child: 
        Consumer<ToggleAnswer>(
          builder: (context, model, child) {
            return 
              Scaffold(
                body: Container(
                  color: Color.fromRGBO(236, 241, 247, 1.0),
                  constraints: BoxConstraints.expand(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        wordList[model.answerCount]['word'],
                        style: TextStyle(fontSize: 30),),
                      Text(
                        model.toggleAnswer ? wordList[model.answerCount]['answer'] : '',
                        style: TextStyle(fontSize: 30),),
                      RaisedButton(
                        child: Text('解答を表示'),
                        onPressed: ((){ model.switchAnswer(); })
                      ),
                      RaisedButton(
                        child: Text('次へ'),
                        onPressed: ((){ 
                          if(model.toggleAnswer){ model.switchAnswer(); }
                          model.incrementCount(); 
                        })
                      ),
                      RaisedButton(
                        child: Text('リセット'),
                        onPressed: ((){ model.resetCount(); })
                      )
                    ]
                  )
                )
              );
          },
        )
    );
  }
}

class ToggleAnswer extends ChangeNotifier{
  bool _toggleAnswer = false;
  int _answerCount = 0;

  bool get toggleAnswer => _toggleAnswer;
  int get answerCount => _answerCount;

  void switchAnswer(){
    _toggleAnswer = !_toggleAnswer;
    notifyListeners();
  }

  void incrementCount() {
    if(_answerCount < 9){
      _answerCount++;
    }
    notifyListeners();
  }

  void resetCount() {
    _answerCount = 0;
    notifyListeners();
  }
}