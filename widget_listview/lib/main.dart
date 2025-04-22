import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

//build内に処理を書く
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:ListViewSample()
    );
  }
}

class ListViewSample extends StatefulWidget {
  const ListViewSample({super.key});

  @override
  State<ListViewSample> createState() => _ListViewSampleState();
}

class _ListViewSampleState extends State<ListViewSample> {

  //ListTileを返す関数
  Widget createListTile(int num){
    return ListTile(
      leading: Icon(Icons.favorite),
      title: Text('$num',style: TextStyle(fontSize: 64),),
      trailing: Icon(Icons.star),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar:画面上部の設計
      appBar: AppBar(
        title: Text('ListViewの基礎'),
        backgroundColor: Colors.blue,
      ),
      //ListView:スクロール対応可能
      body:ListView(
        children: [
          createListTile(1),
          createListTile(2),
          createListTile(3),
          createListTile(4),
          createListTile(5),
          createListTile(6),
          createListTile(7),
          createListTile(8),
          createListTile(9),
        ],
      )
    );
  }
}