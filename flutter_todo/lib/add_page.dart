import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  //TextFieldの入力内容を監視
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //サイズの情報を持った透明の箱
            SizedBox(
              width:300.0, //横幅
              child: TextField(
                controller: _controller,//監視役の設定
                decoration: InputDecoration(
                  border: OutlineInputBorder()
                ),
              )
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: (){
                //何も入力されてなかったら戻れないようにする(早期リターン)
                if(_controller.text == '') return;

                //前の画面に戻る時に「_controller.text」の情報も持って帰る
                debugPrint('持って帰る値：${_controller.text}');
                Navigator.pop(context,_controller.text);
              }, 
              child: Text('追加')
            )
          ],
        )
      )
    );
  }
}