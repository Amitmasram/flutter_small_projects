import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibmi/widgets/info_card.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  double? _deviceHeight, _deviceWidth;
  int _age = 20, _weight = 160, _height = 70, _gender = 0;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
        child: Center(
      child: Container(
        height: _deviceHeight! * 0.85,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [_ageSelectContainer(), _weightSelectContainer()],
              ),
              _heightSelectContainer(),
              _genderSelectContainer(),
              _calculateBmiButton()
            ],
          ),
        ),
      ),
    ));
  }

  Widget _ageSelectContainer() {
    return InfoCard(
      width: _deviceWidth! * 0.45,
      height: _deviceHeight! * 0.20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            'Age yr',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          Text(
            _age.toString(),
            style: const TextStyle(fontSize: 45, fontWeight: FontWeight.w700),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                child: CupertinoDialogAction(
                    onPressed: () {
                      setState(() {
                        _age--;
                      });
                    },
                    child: const Text(
                      '-',
                      style: TextStyle(fontSize: 25, color: Colors.red),
                    )),
              ),
              SizedBox(
                width: 50,
                child: CupertinoDialogAction(
                    onPressed: () {
                      setState(() {
                        _age++;
                      });
                    },
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 25, color: Colors.red),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _weightSelectContainer() {
    return InfoCard(
      width: _deviceWidth! * 0.45,
      height: _deviceHeight! * 0.20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            'Weight lbs',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          Text(
            _weight.toString(),
            style: const TextStyle(fontSize: 45, fontWeight: FontWeight.w700),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                child: CupertinoDialogAction(
                    onPressed: () {
                      setState(() {
                        _weight--;
                      });
                    },
                    child: const Text(
                      '-',
                      style: TextStyle(fontSize: 25, color: Colors.red),
                    )),
              ),
              SizedBox(
                width: 50,
                child: CupertinoDialogAction(
                    onPressed: () {
                      setState(() {
                        _weight++;
                      });
                    },
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 25, color: Colors.red),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _heightSelectContainer() {
    return InfoCard(
      width: _deviceWidth! * 0.90,
      height: _deviceHeight! * 0.15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            'Height In',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          Text(
            _height.toString(),
            style: const TextStyle(fontSize: 45, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            width: _deviceWidth! * 0.80,
            child: CupertinoSlider(
                max: 96,
                min: 0,
                divisions: 96,
                value: _height.toDouble(),
                onChanged: (_value) {
                  setState(() {
                    _height = _value.toInt();
                  });
                }),
          )
        ],
      ),
    );
  }

  Widget _genderSelectContainer() {
    return InfoCard(
      width: _deviceWidth! * 0.90,
      height: _deviceHeight! * 0.11,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            'Gender',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          CupertinoSlidingSegmentedControl(
              groupValue: _gender,
              children: {0: const Text('Male'), 1: const Text('Female')},
              onValueChanged: (_value) {
                setState(() {
                  _gender = _value as int;
                });
              })
        ],
      ),
    );
  }

  Widget _calculateBmiButton() {
    return Container(
      height: _deviceHeight! * 0.07,
      child: CupertinoButton.filled(
          child: const Text('Calculate BMI'),
          onPressed: () {
            if (_height > 0 && _weight > 0 && _age > 0) {
              double _bmi = 703 * (_weight / pow(_height, 2));

              _showResultDialog(_bmi);
            }
          }),
    );
  }

  void _showResultDialog(double _bmi) {
    String? _status;
    if (_bmi < 18.5) {
      _status = "Underweight";
    } else if (_bmi >= 18.5 && _bmi < 25) {
      _status = "Normal";
    } else if (_bmi >= 25 && _bmi < 30) {
      _status = "OverWeight";
    } else if (_bmi >= 30) {
      _status = "Obese";
    }
    showCupertinoDialog(
        context: context,
        builder: (BuildContext _context) {
          return CupertinoAlertDialog(
            title: Text(_status!),
            content: Text(
              _bmi.toStringAsFixed(2),
            ),
            actions: [
              CupertinoDialogAction(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pop(_context);
                },
              )
            ],
          );
        });
  }
}


// Card(
//           elevation: 5, // Sets the elevation (shadow) of the card
//           child: Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Text(
//                   'Card Example',
//                   style: TextStyle(fontSize: 20),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   'This is a simple card in Flutter.',
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ],
//             ),
//           ),
//         ),