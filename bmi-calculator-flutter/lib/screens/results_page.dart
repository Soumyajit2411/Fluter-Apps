import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../components/buttom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(this.bmiresult,this.resulttext,this.interpretationst);
  final String bmiresult;
  final String resulttext;
  final String interpretationst;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: ktitletextstyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              null,
              kactivecardcolor,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resulttext.toUpperCase(),
                    style: kresultstyle,
                  ),
                  Text(
                    bmiresult,
                    style: kbmistyle,
                  ),
                  Text(
                    interpretationst,
                    textAlign: TextAlign.center,
                    style: kbodystyle,
                  )
                ],
              ),
            ),
          ),
          Buttombutton(() {
            Navigator.pop(context);
          }, 'RE-CALCULATE'),
        ],
      ),
    );
  }
}
