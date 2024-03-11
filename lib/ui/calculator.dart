import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int? firstnum;
  int? secondnum;
  String textToDisplay = '';
  String? result;
  String? operators;

  void onClicked(String txtbtn) {
    if (txtbtn == 'C') {
      setState(() {
        firstnum = null;
        secondnum = null;
        textToDisplay = '';
        result = '';
        operators = null;
      });
    } else if (txtbtn == '+' ||
        txtbtn == '-' ||
        txtbtn == '*' ||
        txtbtn == '/') {
      setState(() {
        firstnum = int.tryParse(textToDisplay);
        textToDisplay = '';
        result = '';
        operators = txtbtn;
      });
    } else if (txtbtn == '=') {
      secondnum = int.tryParse(textToDisplay);
      if (operators == '+') {
        result = (firstnum! + secondnum!).toString();
      } else if (operators == '-') {
        result = (firstnum! - secondnum!).toString();
      } else if (operators == '*') {
        result = (firstnum! * secondnum!).toString();
      } else if (operators == '/') {
        if (secondnum == 0) {
          result = 'Error';
        } else {
          result = (firstnum! / secondnum!).toString();
        }
      }
      setState(() {
        textToDisplay = result!;
        firstnum = null; // Reset the first number after calculation
        secondnum = null; // Reset the second number after calculation
        operators = null; // Reset the operator after calculation
      });
    } else {
      setState(() {
        textToDisplay += txtbtn;
      });
    }
  }

  Widget textButton(String txtbtn) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => onClicked(txtbtn),
        child: Text(txtbtn,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 40),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              textToDisplay,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ), const SizedBox(height: 40),
            Row(
              children: [
                textButton('7'),
                const SizedBox(width: 7
                  ,),
                textButton('8'),
                const SizedBox(width: 7
                ),
                textButton('9'),
                const SizedBox(width: 7
                ),
                textButton('+'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                textButton('7'
                    ''),
                const SizedBox(width: 7
                ),
                textButton('5'),
                const SizedBox(width: 7
                ),
                textButton('4'),
                const SizedBox(width: 7
                ),
                textButton('-'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                textButton('3'),
                const SizedBox(width: 7
                ),
                textButton('2'),
                const SizedBox(width: 7
                ),
                textButton('1'),
                const SizedBox(width: 7
                ),
                textButton('*'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                textButton('C'),
                const SizedBox(width: 7
                ),
                textButton('0'),
                const SizedBox(width: 7
                ),
                textButton('/'),
                const SizedBox(width: 7
                ),
                textButton('='),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Calculator(),
  ));
}
