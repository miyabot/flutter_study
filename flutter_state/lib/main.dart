import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//StatelessWidget:状態(State)を持たないWidget
//使用例:画面の更新が不要な場合に使用
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //build内に処理を書く
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:StateSample()
    );
  }
}

//StatefulWidget:状態(State)を持つWidget
//使用例：画面の更新が必要な時に使用
class StateSample extends StatefulWidget {
  const StateSample({super.key});

  @override
  State<StateSample> createState() => _StateSampleState();
}

class _StateSampleState extends State<StateSample> {

  //変数や関数の定義場所
  int cnt = 0;

  //build内に処理を書く
  @override
  Widget build(BuildContext context) {
   return Scaffold(
        body: Column(
          children: [
            Text('$cnt',style: TextStyle(fontSize: 36),),
            ElevatedButton(
              onPressed: (){
                //setState:画面を更新してくれる
                setState(() {
                  cnt++;
                });
                debugPrint('現在の値$cnt');
              }, 
              child: Text('PUSH')
            ),
          ],
        )
      );
  }
}



