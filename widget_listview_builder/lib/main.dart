import 'package:flutter/material.dart';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:ListViewBuilder()
    );
  }
}

class ListViewBuilder extends StatefulWidget {
  const ListViewBuilder({super.key});

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {

  List<String> items = ['りんご','ぶどう','イチゴ','みかん','穐原','ばなな'];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //スクロール対応(動的リスト)
      body:ListView.builder(
        itemCount: items.length,//要素数
        //index:現在の要素番号
        itemBuilder: (context,index){
          return ListTile(
            title: Text(items[index],style: TextStyle(fontSize: 36),),
          );
        },
      ),
      //画面下にボタンを配置　
      floatingActionButton:FloatingActionButton(
        //押された時に呼ばれる処理
        onPressed:(){
          setState(() {
            items.add('さくらんぼ');  
          });
          debugPrint('itemsの中身:$items');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
