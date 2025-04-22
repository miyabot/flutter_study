import 'package:flutter/material.dart';
import 'package:widget_navigator/second_page.dart';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:ElevatedButton(
          onPressed: (){
            //画面遷移
            Navigator.push(
              context, //現在地
              MaterialPageRoute(builder: (context)=>const SecondPage()) //遷移先の指定
            );
          }, 
          child: Text('次へ'),
        )
      ),
    );
  }
}

