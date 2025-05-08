import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:CalendarPage()
    );
  }
}

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {

  //選択中の日付を管理
  DateTime _seletedDay = DateTime.now();

  //フォーカスがあてられるページを管理
  DateTime _focusedDay = DateTime.now();

  //フォーマットを管理
  CalendarFormat _calendarFormat = CalendarFormat.week;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('カレンダーページ'),
        backgroundColor: Colors.blue,
      ),
      body:TableCalendar(
        calendarFormat: _calendarFormat, //フォーマットの指定
        focusedDay: _focusedDay, //フォーカス(強調表示)する日を指定
        firstDay: DateTime.utc(2025,1,1), //カレンダーの最初の日を指定
        lastDay: DateTime.utc(2025,12,31), //カレンダーの最後の日を指定

        
        //どの日付が選択されたかを判定する関数
        selectedDayPredicate: (day){
          //２つのDateTimeオブジェクトを比較して一致していた場合、trueを返す
          return isSameDay(_seletedDay, day);
        },

        //日付を選択した時に呼ばれる
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _seletedDay = selectedDay;
            _focusedDay = focusedDay;
            debugPrint('選択された日：$_seletedDay');
            debugPrint('フォーカスされた日：$_focusedDay');
          });
        },

        //ページを切り替えた時に呼ばれる
        onPageChanged: (focusdDay){
          _focusedDay = focusdDay;
        },

        //フォーマットを切り替えた時に呼ばれる
        onFormatChanged: (format) {
          setState(() {
            _calendarFormat = format;
          });
        },
      )
    );
  }
}