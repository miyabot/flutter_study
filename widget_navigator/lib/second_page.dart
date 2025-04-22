import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:ElevatedButton(
          onPressed: (){
            //前の画面に戻る
            Navigator.pop(context);
          }, 
          child: Text('戻る'),
        )
      ),
    );
  }
}