import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedcurrrency = 'AUD';
  CoinData coindata = CoinData();

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropownitems = [];
    for (String curr in currenciesList) {
      dropownitems.add(
        DropdownMenuItem(
          child: Text(curr),
          value: curr,
        ),
      );
    }
    return DropdownButton<String>(
      value: selectedcurrrency,
      items: dropownitems,
      onChanged: (value) {
        setState(() {
          selectedcurrrency = value;
          getData();
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
        setState(() {
          selectedcurrrency = currenciesList[selectedIndex];

          getData();
        });
      },
      children: pickerItems,
    );
  }

  Map<String, String> coinValues = {};
  bool empty = true;

  void getData() async {
    empty = true;
    var data = await CoinData().getData(selectedcurrrency);
    try {
      setState(() {
        coinValues = data;
      });
      empty = false;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Cryptocard(
                  'BTC', empty ? '?' : coinValues['BTC'], selectedcurrrency),
              Cryptocard(
                  'ETH', empty ? '?' : coinValues['ETH'], selectedcurrrency),
              Cryptocard(
                  'LTC', empty ? '?' : coinValues['LTC'], selectedcurrrency),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}

class Cryptocard extends StatelessWidget {
  const Cryptocard(
    this.cryptocurrrency,
    this.bitcoin,
    this.selectedcurrrency,
  );

  final String bitcoin;
  final String selectedcurrrency;
  final String cryptocurrrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptocurrrency = $bitcoin $selectedcurrrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
