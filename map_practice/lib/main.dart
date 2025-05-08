import 'package:flutter/material.dart';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:MapSample()
    );
  }
}

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {

  //Map型：キーバリュー型(連想配列)
  //キー(key)と値(value)のペアでデータ管理する
  List<Map<String,String>> phonebook = [  
  {
    '氏名':'宮本',
    '電話番号':'090-1234-5678',
    '住所':'三宮',
    '年齢':'20',
  },
  {
    '氏名':'穐原',
    '電話番号':'080-8765-4321',
    '住所':'なし',
    '年齢':'50',
  },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Text('${phonebook[0]['氏名']}',
          style: TextStyle(fontSize: 38),
        ),
      )
    );
  }
}