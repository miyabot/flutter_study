import 'package:flutter/material.dart';

void main() {
  int cnt = 0; //カウンタ変数

  runApp(
    //基盤作成
    MaterialApp(
      //Scaffold:下地を作成
      home:Scaffold(
        //appbar:画面上部の作成
        appBar: AppBar(
          title: Text('ボタンの基礎'),
          backgroundColor: Colors.blue,
        ),
        //widget(パーツ)を真ん中に配置
        body:Center(
          //TextButton:Textをボタン化する
          //OutlinedButton:外枠あり
          //ElevatedButton:立体的なボタン(影付き)
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$cnt',style: TextStyle(fontSize: 36)),
              ElevatedButton(
                //押した時の処理
                onPressed: (){
                  cnt++;
                  //$:変数の中身を表示
                  debugPrint('現在の値：$cnt');
                }, 
                //ボタンに表示するWidgetの指定
                child: Text('PUSH',style: TextStyle(fontSize: 72),)
                //child: Icon(Icons.home,size:72),
              ),
            ],
          ),
        )
      )
    )
  );
}

