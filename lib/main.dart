import 'package:calculator/button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var userQuestion = '';
  var userAnswer = '';
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.deepOrange[100],
      body: Column(
        children: [
          SizedBox(height: 20,),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                      child: Text(userQuestion,style: TextStyle(fontSize: 20),),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(userAnswer,style: TextStyle(fontSize: 20),),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                child: Center(
                    child: GridView.builder(
                        itemCount: buttons.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          // Clear Button
                          if (index == 0) {
                            return MyButton(
                              buttonTapped: (){
                               setState(() {
                                 userQuestion ='';
                               });
                              },
                              buttonText: buttons[index],
                              color: Colors.green,
                              textColor: Colors.white,
                            ); //Delete Button
                          } else if (index == 1) {
                            return MyButton(
                              buttonTapped: (){
                                setState(() {
                                  userQuestion=userQuestion.substring(0,userQuestion.length-1);
                                });
                              },
                              buttonText: buttons[index],
                              color: Colors.redAccent,
                              textColor: Colors.white,
                            );
                          } else
                            return MyButton(
                              buttonTapped: (){
                                setState(() {
                                  userQuestion =userQuestion+buttons[index];
                                });
                              },
                              buttonText: buttons[index],
                              color: isOperator(buttons[index])
                                  ? Colors.deepOrange
                                  : Colors.deepOrange[50],
                              textColor: isOperator(buttons[index])
                                  ? Colors.white
                                  : Colors.deepOrange,
                            );
                        })),
              )),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }
}
