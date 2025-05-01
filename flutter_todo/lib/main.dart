import 'package:flutter/material.dart';
import 'package:flutter_todo/add_page.dart';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //ToDoリストの内容を管理
  List<String> _titleList = [];
  List<String> _subTitleList = [];

  List<Map<String,String>> _list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Map型ではListViewの処理に向いていない
      body:ListView.builder(
        itemCount: _list.length,//リストの要素数
        //要素ごとの処理を書く
        itemBuilder: (context,index){
          final item = _list[index];
          return ListTile(
            title: Text(item['title']!),
            subtitle: Text(item['subTitle']!),
            trailing: IconButton(
              onPressed: (){
                setState(() {
                  //指定した場所のリストを削除
                  _titleList.removeAt(index);
                });
              },
              icon: Icon(Icons.delete),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        //async,await:非同期処理
        onPressed: () async{
          //戻ってきた値を格納する変数
          //?:NULL許容型
          final Map<String,String> result;

          //画面遷移
          result = await Navigator.push(
            context, 
            MaterialPageRoute(builder: (context)=>AddPage())
          );

          setState(() {
            //add:リストに追加
            //_titleList.add(result['title']!);
            //_subTitleList.add(result['subTitle']!);
            _list.add(result);
          });
          
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
