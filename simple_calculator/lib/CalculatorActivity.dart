import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_calculator/utils/ViewUtils.dart';

class CalculatorActivity extends StatefulWidget {
  @override
  _CalculatorActivityState createState() => _CalculatorActivityState();
}

class _CalculatorActivityState extends State<CalculatorActivity> {
  int firstNumber = 0;
  int secondNumber = 0;
  String resultNumber = "";
  String selectedOperator;
  String operation = "";
  bool _isFirstNumber = true;

  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    // bool _isSecondNumber = false;

    Widget setNumberButton(int number) {
      return Expanded(
        child: FlatButton(
            padding: EdgeInsets.all(8),
            onPressed: () {
              setState(() {
                operation += number.toString();

                if (_isFirstNumber) {
                  String getNumber = firstNumber.toString() + number.toString();

                  firstNumber = int.parse(getNumber.toString());
                  print("clicked button firstNumber" + firstNumber.toString());
                } else {
                  String getNumber =
                      secondNumber.toString() + number.toString();

                  secondNumber = int.parse(getNumber.toString());
                  print(
                      "clicked button secondNumber" + secondNumber.toString());
                }
              });
            },
            child: Container(
              height: 30,
              alignment: Alignment.center,
              width: double.infinity,
              color: Colors.teal.shade100,
              child: Text(number.toString(),
                  style: TextStyle(color: Colors.grey.shade800)),
            )),
      );
    }

    String calculate(String mathSymbol) {
      print("calculate called " + mathSymbol);

      switch (selectedOperator) {
        case "+":
          {
            return (firstNumber + secondNumber).toString();
          }
        case "-":
          {
            return (firstNumber - secondNumber).toString();
          }
        case "*":
          {
            return (firstNumber * secondNumber).toString();
          }
        case "/":
          {
            return (firstNumber / secondNumber).toString();
          }
      }
    }

    void showToast(String msg) {
      ViewUtils().showToast(msg);
    }

    Widget setMathButton(String mathSymbol, {int getFlex = 1}) {
      return Expanded(
        flex: getFlex,
        child: FlatButton(
            padding: EdgeInsets.all(8),
            onPressed: () {
              setState(() {
                print("clicked button $mathSymbol");

                if (!isDone) {
                  operation += " $mathSymbol";
                  isDone = true;
                } else {
                  // showToast('Silahkan Klik Tombol "Clear "');
                }

                // if ( != null) {
                //   resultNumber = calculate(mathSymbol);
                // }

                if (mathSymbol == "=") {
                  //do calculate
                  resultNumber = calculate(mathSymbol);
                } else if (mathSymbol == "Clear") {
                  //clear
                  resultNumber = "";
                  operation = "";
                  firstNumber = 0;
                  secondNumber = 0;
                  isDone = false;
                  _isFirstNumber = true;
                  // _isFirstNumber = true;
                } else {
                  _isFirstNumber = false;
                  selectedOperator = mathSymbol;
                }

                setState(() {});
              });
            },
            child: Container(
              height: 30,
              alignment: Alignment.center,
              width: double.infinity,
              color: Colors.teal.shade800,
              child: Text(mathSymbol, style: TextStyle(color: Colors.white)),
            )),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator App"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            resultNumber,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.teal[900],
                fontSize: 20),
          ),
          Text(
            operation,
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.teal[900], fontSize: 18),
          ),
          Row(
            children: <Widget>[
              setMathButton("+"),
              setMathButton("-"),
              setMathButton("*"),
              setMathButton("/"),
            ],
          ),
          Row(
            children: <Widget>[
              setMathButton("=", getFlex: 3),
              setMathButton("Clear"),
            ],
          ),
          Row(
            children: <Widget>[
              setNumberButton(1),
              setNumberButton(2),
              setNumberButton(3),
            ],
          ),
          Row(
            children: <Widget>[
              setNumberButton(4),
              setNumberButton(5),
              setNumberButton(6),
            ],
          ),
          Row(
            children: <Widget>[
              setNumberButton(7),
              setNumberButton(8),
              setNumberButton(9),
            ],
          ),
          Row(
            children: <Widget>[
              setNumberButton(0),
            ],
          ),
        ],
      ),
    );
  }
}
