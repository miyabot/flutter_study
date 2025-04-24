import 'package:flutter/material.dart';
import 'package:widget_bottom_nav/account.dart';
import 'package:widget_bottom_nav/calendar.dart';
import 'package:widget_bottom_nav/home.dart';
import 'package:widget_bottom_nav/setting.dart';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:BottomNav()
    );
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  //選択中のアイテム管理変数
  int _currentIndex = 0;

  //表示するページ管理変数
  //リストはファイナルで宣言
  final List _page = [
    const HomePage(),
    const CalendarPage(),
    const SettingPage(),
    const AccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:_page[_currentIndex],

      //画面下部に表示するバー
      bottomNavigationBar: BottomNavigationBar(
        //４つ以上並べる場合(デフォルト３つまで)
        type:BottomNavigationBarType.fixed,

        //現在選択されているアイテムの指定
        currentIndex: _currentIndex,

        //selectedIndex:タップされたアイコンの番号
        onTap: (int selectedIndex){
          setState(() {
            //_currentは現在のインデックス
            //selectはタップされたインデックス
            _currentIndex = selectedIndex;
          });
        },

        //見た目の装飾
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month),label: 'calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'setting'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'account'),
        ]
      ),
    );
  }
}