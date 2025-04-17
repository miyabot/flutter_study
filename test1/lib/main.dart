import 'package:flutter/material.dart';

//エントリーポイント(最初に呼ばれる)
void main() {
  //実行するアプリの指定
  runApp(
    //アプリの基盤を作成
    MaterialApp(
      //home:最初に呼び出したいページの指定
      //scaffold:アプリの骨組みを作成する
      home:Scaffold(
        body:Text('Test')
      )
    )
  ); 
}

