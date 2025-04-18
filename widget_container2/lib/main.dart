import 'package:flutter/material.dart';

//エントリーポイント(最初に呼ばれる)
void main() {
  //Widgetを変数にまとめる
  Widget con2 = Container(
    width: 100, //横幅
    height: 100, //縦幅
    color: Colors.blue, //色
  );

  Widget con1 = Container(
    width: 200, //横幅
    height: 200, //縦幅
    color: Colors.red, //色
    alignment: Alignment.center, //親の中に子を配置する際に使用
    child: con2,
  );

  //実行するアプリの指定
  runApp(
    //アプリの基盤を提供
    MaterialApp(
      //home:最初に呼び出したいページの指定
      //scaffold:アプリの下地を用意
      home: Scaffold(
        //Center:中央に寄せる
        body: Center(
          //Column:縦に並べる(複数配置可)
          child: Column(
            //中央に寄せる
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('コンテナ２'),
              //Container:見た目を整えることができる箱
              con1
            ],
          ),
        ),
      ),
    ),
  );
}
