import 'package:calculator/calculator.dart';
import 'package:calculator/exception.dart';
import 'package:calculator/expanded_btn.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorHomePage(title: 'Calculator'),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({super.key, required this.title});
  final String title;

  @override
  State<CalculatorHomePage> createState() => _CalculatorHomePage();
}

class _CalculatorHomePage extends State<CalculatorHomePage> {
  String _str = "0";
  var _calculation = Calculation();
  void add(String a) {
    setState(() {
      _calculation.add(a);
      _str = _calculation.getString();
    });
  }

  void deleteAll() {
    setState(() {
      _calculation.deleteAll();
      _str = _calculation.getString();
    });
  }

  void deleteOne() {
    setState(() {
      _calculation.deleteOne();
      _str = _calculation.getString();
    });
  }

  void getResult() {
    setState(() {
      try {
        _str = _calculation.getResult().toString();
      } on DivideByZeroException {
        _str = "You mustn't divided by 0";
      } finally {
        _calculation = Calculation();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Card(
              color: Colors.lightGreen[50],
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  _str,
                  textScaleFactor: 2.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 3,
                  child: TextButton(
                    onPressed: () {
                      deleteAll();
                    },
                    child: Text(
                      'C',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {
                      deleteOne();
                    },
                    child: Text(
                      '<-',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ExpandedRow(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ExpandedButton(
                            onPressed: () {
                              add('7');
                            },
                            child: Text(
                              '7',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          ExpandedButton(
                            onPressed: () {
                              add('8');
                            },
                            child: Text(
                              '8',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          ExpandedButton(
                            onPressed: () {
                              add('9');
                            },
                            child: Text(
                              '9',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                      ExpandedRow(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ExpandedButton(
                            onPressed: () {
                              add('4');
                            },
                            child: Text(
                              '4',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          ExpandedButton(
                            onPressed: () {
                              add('5');
                            },
                            child: Text(
                              '5',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          ExpandedButton(
                            onPressed: () {
                              add('6');
                            },
                            child: Text(
                              '6',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                      ExpandedRow(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ExpandedButton(
                            onPressed: () {
                              add('1');
                            },
                            child: Text(
                              '1',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          ExpandedButton(
                            onPressed: () {
                              add('2');
                            },
                            child: Text(
                              '2',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          ExpandedButton(
                            onPressed: () {
                              add('3');
                            },
                            child: Text(
                              '3',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                      ExpandedRow(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ExpandedButton(
                            onPressed: () {
                              add('0');
                            },
                            child: Text(
                              '0',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          ExpandedButton(
                            onPressed: () {
                              add('.');
                            },
                            child: Text(
                              '.',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          ExpandedButton(
                            onPressed: () {
                              getResult();
                            },
                            child: Text(
                              '=',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ExpandedButton(
                        onPressed: () {
                          add('÷');
                        },
                        key: const Key("divide button"),
                        child: Image.asset(
                          "icons/divide.png",
                          width: 30.0,
                          height: 30.0,
                        ),
                      ),
                      ExpandedButton(
                        onPressed: () {
                          add('x');
                        },
                        child: const Text(
                          'x',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      ExpandedButton(
                        onPressed: () {
                          add('-');
                        },
                        child: const Text(
                          '-',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      ExpandedButton(
                        onPressed: () {
                          add('+');
                        },
                        child: const Text(
                          '+',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
