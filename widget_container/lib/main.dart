import 'package:flutter/material.dart';

void main() {

  runApp(
    MaterialApp(
      home:Scaffold(
        //body:１つのwidgetしか指定できない
        //Column:縦に複数のwidgetを並べる
        //Row:横に複数のwidgetを並べる
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('コンテナの基礎'),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //container:見た目を整えることが出来る箱
                  Container(
                    color:Colors.red,//色
                    width:100,//横幅
                    height: 100,//縦幅
                  ),
                  Container(
                    color:Colors.green,//色
                    width:100,//横幅
                    height: 100,//縦幅
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //container:見た目を整えることが出来る箱
                  Container(
                    color:Colors.blue,//色
                    width:100,//横幅
                    height: 100,//縦幅
                  ),
                  Container(
                    color:Colors.yellow,//色
                    width:100,//横幅
                    height: 100,//縦幅
                  ),
                ],
              ),
            ],
          ),
        )
      )
    )
  );
}

