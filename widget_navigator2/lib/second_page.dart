import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  //コンストラクタ(生成されるタイミングで呼ばれる)
  const SecondPage({super.key,required this.newCnt}); //引数の設定

  final int newCnt;//受け取り用

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Text('受け取った値：$newCnt'),
      )
    );
  }
}