import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: ElevatedButton(
          onPressed: (){
            //ダイアログの表示
            showDialog(
              context: context, 
              //ダイアログの見た目を変える
              builder: (context)=>AlertDialog(
                backgroundColor: Colors.white, //背景色
                title: Center(child: Text('アカウント削除',style: TextStyle(fontWeight: FontWeight.bold),)), //タイトル
                content: Text('削除すると以下の情報がすべて失われます'), //本文
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,//等間隔に並べる
                    children: [
                      ElevatedButton(
                        //見た目の変更
                        style:ElevatedButton.styleFrom(
                          minimumSize: Size(100,50),
                          backgroundColor: Colors.white
                        ),
                        onPressed: (){
                          Navigator.pop(context);  
                        }, 
                        child: Text('キャンセル',style: TextStyle(color: const Color.fromARGB(184, 0, 0, 0)),)
                      ),
                      ElevatedButton(
                        style:ElevatedButton.styleFrom(
                          minimumSize: Size(100,50),
                          backgroundColor: const Color.fromARGB(255, 250, 115, 105)
                        ),
                        onPressed: (){
                          //タスクキル
                          exit(0);
                        }, 
                        child: Text('削除',style: TextStyle(color: Colors.white))
                      ),
                    ],
                  )
                ],
              )
            );
          }, 
          child: Text('アカウント削除')
        ),  
      )
    );
  }
}
