import 'package:flutter/material.dart';

import 'dart:async';  //Timer用


void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TimerPage(),
    );
  }
}

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {

  //カウンタ変数
  int cnt = 0;

  //ストップウォッチ用
  //late：初期化を後回しにする
  late Stopwatch _stopwatch; 

  //最初に実行される関数
  @override
  void initState() {
    super.initState();

    //ストップウォッチの機能を代入
    _stopwatch = Stopwatch(); 

    //30ミリ秒ごとに画面を更新
    Timer.periodic(
      Duration(milliseconds: 30), //実行間隔(１秒ごと)
      (Timer timer){
        setState(() {});
      }
    );
  }

  //表示用の時間を(分:秒.ミリ秒)をフォーマット
  String _formatTime(){
    final _elapsed = _stopwatch.elapsed;//経過時間の取得

    String minutes = (_elapsed.inMinutes % 60).toString().padLeft(2,'0');
    String seconds = (_elapsed.inSeconds % 60).toString().padLeft(2,'0');
    String milliSeconds = (_elapsed.inMilliseconds % 1000).toString().padLeft(3,'0');

    return '$minutes:$seconds.$milliSeconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        //elapsed:経過時間の取得
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '経過時間：${_formatTime()}',
              style:TextStyle(fontSize: 32)
            ),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      //タイマースタート
                      _stopwatch.start();  
                    });
                  }, 
                  child: Text('スタート')
                ),
                SizedBox(width: 16,),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      //タイマーストップ
                      _stopwatch.stop();
                    });
                  }, 
                  child: Text('ストップ')
                ),
                SizedBox(width: 16,),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      //タイマーリセット
                      _stopwatch.reset();
                    });
                  }, 
                  child: Text('リセット')
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}