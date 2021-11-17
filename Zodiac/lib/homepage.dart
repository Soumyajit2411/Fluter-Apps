import 'package:flutter/material.dart';
import 'result.dart';
import 'buttom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _dateTime = DateTime.now();

  void _showDataPicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('HOROSCOPE'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: TextButton(
              child: const Text('Date of Birth'),
              style: TextButton.styleFrom(
                primary: Colors.teal,
                shadowColor: Colors.red,
              ),
              onPressed: () {
                _showDataPicker();
              },
            ),
          ),
          Buttombutton(
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    _dateTime,
                  ),
                ),
              );
            },
            'See Horoscope',
          ),
        ],
      ),
    );
  }
}
