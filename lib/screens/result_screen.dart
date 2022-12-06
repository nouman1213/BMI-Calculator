import 'package:bmi_calculator/components/bmi_card.dart';
import 'package:flutter/material.dart';

import '../components/bottom_button.dart';
import '../constants/const.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.interpretation,
      required this.bmiResult,
      required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('BMI Calculator'),
        backgroundColor: Colors.transparent,
        leading: Image.asset(
          'assets/bmi.png',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Image.asset(
              'assets/result.png',
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),
          Expanded(
            flex: 5,
            child: BmiCard(
              color: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
