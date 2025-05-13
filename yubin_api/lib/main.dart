import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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

  //TextField監視用
  TextEditingController _controller = TextEditingController();

  //取得した住所情報を格納する変数
  String address = '';

  //エラーメッセージを格納する変数
  String errorMessage = '';

  //郵便番号検索関数(非同期関数)
  Future<void> searchCode(String code) async {
    //APIレスポンスを待っていることを示すメッセージ
    setState(() {
      errorMessage = 'APIレスポンス待ち';
    });

    //郵便番号検索APIへリクエストを送信
    //parse:変換
    final response = await http.get(
      Uri.parse('https://zipcloud.ibsnet.co.jp/api/search?zipcode=$code')
    );

    //APIリクエストが失敗した場合は処理を終了
    //statusCode200：成功
    if(response.statusCode != 200){
      return;
    }
    
    //APIから返ってきたJSONデータをMap型に変換
    final Map<String,dynamic> body = json.decode(response.body);
    //debugPrint('取得した内容：$body');

    //resultというキーを使用して値を取り出す
    final List<dynamic> result = (body['results'] ?? []);
    //debugPrint('取得した内容：$result');

    //結果が空ならエラーメッセージを表示
    if(result.isEmpty){
      setState(() {
        errorMessage = 'そのような郵便番号の住所はありません';
      });
    }
    else{
      setState(() {
        //エラーメッセージのクリア
        errorMessage = '';

        //最初の結果を取得し、住所を代入
        final res = result[0];
        address = '${res['address1']}${res['address2']}${res['address3']}';
        debugPrint(address);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          //TextField内に変更が発生するたびに呼ばれる
          onChanged: (value){
            searchCode(value);
          },
        ),
      ),
      //三項演算子：(条件式) ? 真 : 偽
      body:(errorMessage.isEmpty) ? Text(address): Text(errorMessage)
    );
  }
}