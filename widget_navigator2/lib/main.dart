import 'package:flutter/material.dart';
import 'package:widget_navigator2/second_page.dart';


void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:FirstPage()
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  //カウンタ変数
  int cnt = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$cnt',style: TextStyle(fontSize: 36),),
            ElevatedButton(
              onPressed: (){
                //画面遷移
                Navigator.push(
                  context, //現在位置 
                  MaterialPageRoute(builder: (context)=>SecondFulPage(newCnt: cnt,)) //遷移先の引数(newCnt)に値を(cnt)渡す
                );
              }, 
              child: Text('次のページ')
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            cnt++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}