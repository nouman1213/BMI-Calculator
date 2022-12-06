import 'package:bmi_calculator/components/bmi_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants/calculate_bmi.dart';
import 'package:bmi_calculator/constants/const.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';

import '../components/round-button.dart';

enum Gender { male, female }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Gender? selectedGender;
  int height = 172;
  int weight = 60;
  int age = 20;
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
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: BmiCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                color: selectedGender == Gender.female
                    ? kActiveCardColor
                    : kInactiveCardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/female.png',
                        ),
                      ),
                      Text('Female',
                          style: TextStyle(
                              color: selectedGender == Gender.female
                                  ? Colors.white
                                  : Colors.white60,
                              fontSize: 20))
                    ],
                  ),
                ),
              )),
              Expanded(
                  child: BmiCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                color: selectedGender == Gender.male
                    ? kActiveCardColor
                    : kInactiveCardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/male.png',
                        ),
                      ),
                      Text('Male',
                          style: TextStyle(
                              color: selectedGender == Gender.male
                                  ? Colors.white
                                  : Colors.white60,
                              fontSize: 20))
                    ],
                  ),
                ),
              )),
            ],
          )),
          Expanded(
              child: BmiCard(
            color: kInactiveCardColor,
            child: Column(
              children: [
                const Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    const Text(
                      'cm',
                      style: kLabelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: const Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: kBottomContainerColor,
                    overlayColor: Colors.white.withOpacity(0.5),
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: BmiCard(
                color: kInactiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'WEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: Icons.remove,
                          onPressed: () {
                            setState(
                              () {
                                weight--;
                              },
                            );
                          },
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                            icon: Icons.add,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            })
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                  child: BmiCard(
                color: kInactiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'AGE',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: Icons.remove,
                          onPressed: () {
                            setState(
                              () {
                                age--;
                              },
                            );
                          },
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                            icon: Icons.add,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            })
                      ],
                    )
                  ],
                ),
              )),
            ],
          )),
          BottomButton(
              onTap: () {
                CalculateBMI calc =
                    CalculateBMI(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ResultScreen(
                            interpretation: calc.getInterpretation(),
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult())));
              },
              buttonTitle: 'Calculate Your BMI')
        ],
      ),
    );
  }
}
