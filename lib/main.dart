import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}
class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget Calcbutton (String btntext, Color btnColor, Color textColor ) {
      return Container(
          child: ElevatedButton(onPressed: () {
            calculation(btntext);
          },
            child: Text(btntext,
            style: TextStyle(
              fontSize: 35,
              color: textColor,
            )
          ),
          style:  ElevatedButton.styleFrom(
            shape: CircleBorder(
            ),
            backgroundColor: btnColor,
            padding: EdgeInsets.all(10),
            foregroundColor: Colors.blue,
            
          ),


          ),
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("CalcuWiz"),
        backgroundColor: Colors.black,
        centerTitle: true,

      ),
      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //Calculator Disply
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(padding: EdgeInsets.all(10.0),
                child: Text(text,
                textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // here buttons  function will be called where we will pass  some arguments
                  Calcbutton('AC', Colors.green, Colors.white),
                  Calcbutton('+/-', Colors.orange, Colors.white),
                  Calcbutton('%', Colors.orange, Colors.white),
                  Calcbutton('/', Colors.orange, Colors.white),


              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // here buttons  function will be called where we will pass  some arguments
                Calcbutton('7', Colors.grey, Colors.black),
                Calcbutton('8', Colors.grey, Colors.black),
                Calcbutton('9', Colors.grey, Colors.black),
                Calcbutton('x', Colors.orange, Colors.white),


              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // here buttons  function will be called where we will pass  some arguments
                Calcbutton('4', Colors.grey, Colors.black),
                Calcbutton('5', Colors.grey, Colors.black),
                Calcbutton('6', Colors.grey, Colors.black),
                Calcbutton('+', Colors.orange, Colors.white),


              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // here buttons  function will be called where we will pass  some arguments
                Calcbutton('1', Colors.grey, Colors.black),
                Calcbutton('2', Colors.grey, Colors.black),
                Calcbutton('3', Colors.grey, Colors.black),
                Calcbutton('-', Colors.orange, Colors.white),


              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // here buttons  function will be called where we will pass  some arguments
                Calcbutton('0', Colors.grey, Colors.black),
                Calcbutton('00', Colors.grey, Colors.black),
                Calcbutton('.', Colors.grey, Colors.black),
                Calcbutton('=', Colors.orange, Colors.white),


              ],
            ),
            SizedBox(height: 25,),
          Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.copyright,
                    size: 25,
                    color: Colors.white,
                  ),
                  Text("Copyright by Tanvir",
                  style: TextStyle(
                    color: Colors.white,

                  ),
                  ),
                ],
              )
            ],
          ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );

  }
  // Calculation logic
  dynamic text ='0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {


    if(btnText  == 'AC') {
      text ='0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';

    } else if( opr == '=' && btnText == '=') {

      if(preOpr == '+') {
        finalResult = add();
      } else if( preOpr == '-') {
        finalResult = sub();
      } else if( preOpr == 'x') {
        finalResult = mul();
      } else if( preOpr == '/') {
        finalResult = div();
      }

    } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {

      if(numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if(opr == '+') {
        finalResult = add();
      } else if( opr == '-') {
        finalResult = sub();
      } else if( opr == 'x') {
        finalResult = mul();
      } else if( opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
      // finalResult = btnText;
    }
    else if(btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if(btnText == '.') {
      if(!result.toString().contains('.')) {
        result = result.toString()+'.';
      }
      finalResult = result;
    }

    else if(btnText == '+/-') {
      result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-'+result.toString();
      finalResult = result;

    }

    else {
      result = result + btnText;
      finalResult = result;
    }


    setState(() {
      text = finalResult;
    });

  }


  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }
  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }
  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }


  String doesContainDecimal(dynamic result) {

    if(result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if(!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }
}

