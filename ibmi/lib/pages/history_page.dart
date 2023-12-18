import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibmi/widgets/info_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class HistoryPage extends StatelessWidget {
  double? _deviceHeight, _deviceWidth;

  HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize _deviceHeight and _deviceWidth here if needed
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    SharedPreferences.getInstance();

    return CupertinoPageScaffold(
      // navigationBar: const CupertinoNavigationBar(
      //   middle: Text('History Page'),
      // ),
      child: _dataCard(),
    );
  }

  Widget _dataCard() {
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (BuildContext _context, AsyncSnapshot _snapshot) {
          if (_snapshot.hasData) {
            final _prefs = _snapshot.data as SharedPreferences;
            final _date = _prefs.getString('bmi_date');
            final _data = _prefs.getStringList('bmi_data');
            return Center(
              child: InfoCard(
                width: _deviceWidth! * 0.75,
                height: _deviceHeight! * 0.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _statusText(_data![1]),
                    _dateText(_date!),
                    _bmiText(_data[0])
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CupertinoActivityIndicator(
                color: Colors.blue,
              ),
            );
          }
        });
  }

  Widget _statusText(String _status) {
    return Text(
      _status,
      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
    );
  }

  Widget _dateText(String _date) {
    DateTime _parseDate = DateTime.parse(_date);
    return Text(
      ' ${_parseDate.day}/${_parseDate.month}/${_parseDate.year}',
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
    );
  }

  Widget _bmiText(String _bmi) {
    return Text(
      double.parse(_bmi).toStringAsFixed(2),
      style: const TextStyle(fontSize: 60, fontWeight: FontWeight.w600),
    );
  }
}
