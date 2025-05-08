import 'package:flutter/material.dart';
import 'package:riverpod_study/a.dart';
import 'package:riverpod_study/b.dart';
import 'package:riverpod_study/c.dart';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:_RiverpodStudy()
    );
  }
}

class _RiverpodStudy extends StatefulWidget {
  const _RiverpodStudy({super.key});

  @override
  State<_RiverpodStudy> createState() => __RiverpodStudyState();
}

class __RiverpodStudyState extends State<_RiverpodStudy> {

  //選択中のアイテムを管理
  int _selectIndex = 0;

  //ページを管理
  final List<Widget> _page = [
    A(),
    B(),
    C(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:_page[_selectIndex],

      //画面下部のバー
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _selectIndex,//選択中のアイテム番号の指定

        //index:選択されたアイテムの番号が入っている
        onTap: (index){
          setState(() {
            _selectIndex = index;
          });
        },

        //アイコンの設定
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.edit),label: 'edit'),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: 'search'),
        ]
      ),
    );
  }
}