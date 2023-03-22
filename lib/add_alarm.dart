import 'package:flutter/material.dart';
//import 'package:flutter/widgets/circle_day.dart';
import 'package:ui_clock_and_alarm/widgets/circle_day.dart';

class AddAlarm extends StatefulWidget {
  AddAlarm({Key key}) : super(key: key);

  _AddAlarmState createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  TimeOfDay _selectedTime;
  ValueChanged<TimeOfDay> selectTime;

  @override
  void initState() {
    _selectedTime = new TimeOfDay(hour: 12, minute: 30);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 66, 8, 1),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 66, 8, 1),
          title: Column(
            children: <Widget>[
              Icon(
                Icons.alarm_add,
                color: Color(0xff65D1BA),
              ),
              Text('Add alarm',
                  style: TextStyle(color: Color(0xff65D1BA), fontSize: 25.0))
            ],
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 60.0,
                  ),
                  new GestureDetector(
                    child: Text(
                      _selectedTime.format(context),
                      style: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      _selectTime(context);
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      circleDay('Seg', context, false),
                      circleDay('Ter', context, true),
                      circleDay('Qua', context, true),
                      circleDay('Qui', context, true),
                      circleDay('Sex', context, false),
                      circleDay('Sab', context, true),
                      circleDay('Dom', context, false),
                    ],
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  SizedBox(
                    height: 2.0,
                    child: Container(
                      color: Colors.white30,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                    ),
                    title: Text('Notificação de alarme',
                        style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(
                    height: 2.0,
                    child: Container(
                      color: Colors.white30,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.check_box,
                      color: Colors.white,
                    ),
                    title:
                        Text('Vibrar', style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(
                    height: 2.0,
                    child: Container(
                      color: Colors.white30,
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  // FlatButton(
                  // color: Theme.of(context).accentColor,
                  //  child: Text('Save', style: TextStyle(color: Colors.white)),
                  // onPressed: () => Navigator.of(context).pop()
                  // )
                ],
              ),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pop(),
          backgroundColor: Colors.white,
          child: Icon(
            Icons.delete,
            size: 20.0,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ));
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _selectedTime);
    setState(() {
      _selectedTime = picked;
    });
  }
}
