import 'package:flutter/material.dart';
import 'dart:math';

class CaptchaWidget extends StatefulWidget {
  @override
  _CaptchaWidgetState createState() => _CaptchaWidgetState();
}

class _CaptchaWidgetState extends State<CaptchaWidget> {
  late String expression;
  late int result;
  bool isEnabled = false;

  @override
  void initState() {
    super.initState();
    generateCaptcha();
  }

  void generateCaptcha() {
    final random = Random();
    final num1 = random.nextInt(10) + 1; // Random operand 1 (1-10)
    final num2 = random.nextInt(10) + 1; // Random operand 2 (1-10)

    switch (random.nextInt(4)) {
      case 0:
        expression = '$num1 + $num2 = ?';
        result = num1 + num2;
        break;
      case 1:
        expression = '$num1 - $num2 = ?';
        result = num1 - num2;
        break;
      case 2:
        expression = '$num1 * $num2 = ?';
        result = num1 * num2;
        break;
      case 3:
        expression = '$num1 / $num2 = ?';
        result = (num1 / num2).round();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'CAPTCHA:',
          style: TextStyle(fontSize: 20),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.blue,

          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              expression,
              style: TextStyle(fontSize: 24,fontFamily: 'Muddy Screen IBM VGA',color: Colors.white),
            ),
          ),
        ),
        TextField(
          onChanged: (input) {
            if (int.tryParse(input) == result) {
              isEnabled = true;
              setState(() {

              });
              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(content: Text('CAPTCHA Correct!')),
              // );
            }
            else {
              isEnabled = false;
setState(() {
  
});
            }
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: isEnabled ? () {

              }:null,
              child: Text('Confirm'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  generateCaptcha();
                });
              },
              child: Text('Refresh CAPTCHA'),
            ),
          ],
        ),
      ],
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('CAPTCHA Widget'),
        ),
        body: Center(
          child: CaptchaWidget(),
        ),
      ),
    ),
  );
}
