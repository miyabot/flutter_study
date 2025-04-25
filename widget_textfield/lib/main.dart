import 'package:flutter/material.dart';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:TextFieldSample()
    );
  }
}

class TextFieldSample extends StatefulWidget {
  const TextFieldSample({super.key});

  @override
  State<TextFieldSample> createState() => _TextFieldSampleState();
}

class _TextFieldSampleState extends State<TextFieldSample> {

  //パスワード認証用
  String pass = 'abc123';

  //エラーメッセージフラグ
  bool errorFlg = false;

  //表示・非表示切り替えフラグ
  bool showFlg = true;

  //TextField内を監視するコントローラーの設定
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //TextField:入力可能なフィールド
            //SizedBoxでサイズを決めて、その中にTextFieldを入れる
            SizedBox(
              width:300,
                child: TextField(
                  obscureText: showFlg,
                  controller: _controller,//コントローラーの設定
                  //見た目の装飾
                  decoration: InputDecoration(
                    //suffix:右端
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          //フラグの反転(!)
                          showFlg = !showFlg;
                        });
                      }, 
                      icon: (showFlg == true) ? Icon(Icons.visibility_off) : Icon(Icons.visibility)
                    ),
                    //errorがtureであれば、「:」より左が実行、そうでなければ「:」より右が実行
                    errorText: (errorFlg == true) ? 'パスワードが正しくありません。':null,
                    labelText: 'パスワードを入力してください。',
                    border: OutlineInputBorder()//外枠をつける
                  ),
              ),
            ),
            SizedBox(height: 8,),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  //.textで文字列に変換
                  if(_controller.text == pass){
                    debugPrint('ログイン成功');
                  }
                  else{
                    debugPrint('ログイン失敗');
                    errorFlg = true;
                  }
                });
                
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:Colors.blue,  //背景色
                foregroundColor: Colors.white,//文字色
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                )
              ),
              child: Text('次へ')
            )
          ],
        ),
      )
    );
  }
}