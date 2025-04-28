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
  List<String> _list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView.builder(
        itemCount: _list.length,//リストの要素数
        //要素ごとの処理を書く
        itemBuilder: (context,index){
          return ListTile(
            title: Text(_list[index]),
            trailing: IconButton(
              onPressed: (){
                setState(() {
                  //指定した場所のリストを削除
                  _list.removeAt(index);
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
          final String result;

          //画面遷移
          result = await Navigator.push(
            context, 
            MaterialPageRoute(builder: (context)=>AddPage())
          );

          setState(() {
            //add:リストに追加
            _list.add(result);
          });
          
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
