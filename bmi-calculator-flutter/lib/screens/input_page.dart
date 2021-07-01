import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/buttom_button.dart';
import '../components/roundicon.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedgender;
  int height = 180;
  int weight = 60;
  int age = 20;

  // Color malecardcolor = inactivecardcolor;
  // Color femalecardcolor = inactivecardcolor;
  //
  // void updatecolor(int gender) {
  //   if (gender == 1) {
  //     if (malecardcolor == inactivecardcolor) {
  //       malecardcolor = activecolor;
  //       femalecardcolor = inactivecardcolor;
  //     } else {
  //       malecardcolor = inactivecardcolor;
  //     }
  //   } else {
  //     if (femalecardcolor == inactivecardcolor) {
  //       femalecardcolor = activecolor;
  //       malecardcolor = inactivecardcolor;
  //     } else {
  //       femalecardcolor = inactivecardcolor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  () {
                    setState(() {
                      selectedgender = Gender.male;
                    });
                  },
                  selectedgender == Gender.male
                      ? kactivecardcolor
                      : kinactivecardcolor,
                  IconContent(FontAwesomeIcons.mars, 'MALE'),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  () {
                    setState(() {
                      selectedgender = Gender.female;
                    });
                  },
                  selectedgender == Gender.female
                      ? kactivecardcolor
                      : kinactivecardcolor,
                  IconContent(FontAwesomeIcons.venus, 'FEMALE'),
                ),
              )
            ],
          )),
          Expanded(
            child: ReusableCard(
                null,
                kactivecardcolor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: klabeltextstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: knumbertextstyle,
                        ),
                        Text(
                          'cm',
                          style: klabeltextstyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0XFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0XFFEB1555),
                          overlayColor: Color(0X29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newvalue) {
                          setState(() {
                            height = newvalue.round();
                          });
                        },
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                    null,
                    kactivecardcolor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: klabeltextstyle,
                        ),
                        Text(
                          weight.toString(),
                          style: knumbertextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Roundiconbuttton(FontAwesomeIcons.minus, () {
                              setState(() {
                                weight--;
                              });
                            }),
                            SizedBox(
                              width: 10,
                            ),
                            Roundiconbuttton(FontAwesomeIcons.plus, () {
                              setState(() {
                                weight++;
                              });
                            }),
                          ],
                        ),
                      ],
                    )),
              ),
              Expanded(
                child: ReusableCard(
                    null,
                    kactivecardcolor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ACE',
                          style: klabeltextstyle,
                        ),
                        Text(
                          age.toString(),
                          style: knumbertextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Roundiconbuttton(FontAwesomeIcons.minus, () {
                              setState(() {
                                age--;
                              });
                            }),
                            SizedBox(
                              width: 10,
                            ),
                            Roundiconbuttton(FontAwesomeIcons.plus, () {
                              setState(() {
                                age++;
                              });
                            }),
                          ],
                        ),
                      ],
                    )),
              ),
            ],
          )),
          Buttombutton(() {
            calculatorbrain calc = calculatorbrain(height, weight);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultsPage(
                  calc.calculateBMI(),
                  calc.getResult(),
                  calc.getInterpretation(),
                ),
              ),
            );
          }, 'CALCULATE'),
        ],
      ),
    );
  }
}
