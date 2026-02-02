import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  TextEditingController _con = TextEditingController();
  String _saveStr = '';
  Map<DateTime,String> _saveMap = {};

  //初期化関数
  @override
  void initState(){
    super.initState();
    
    //ロード
    //_loadSaveStr();
    _loadSaveMap();
  }

  //保存されている文字列を読み込む関数
  Future<void> _loadSaveStr() async{
    //保存箱を開ける
    final prefs = await SharedPreferences.getInstance();

    //保存されている文字列を取り出す
    setState(() {
      //データがなければ空文字を使う
      _saveStr = prefs.getString('save_str') ?? '';
    });
  }

  //保存されているMapを読み込む関数
  Future<void> _loadSaveMap() async{
    //保存箱を開ける
    final prefs = await SharedPreferences.getInstance();

    //保存されている文字列を取り出す
    //データがなければ空文字を使う
    final jsonStr = prefs.getString('save_map') ?? '{}';
    

    //JSON文字列をMap<String,dynamic>にデコード
    final decodeMap = json.decode(jsonStr) as Map<String,dynamic>;

    //decodeMapをMap<DateTime,String>に変換
  }


  //入力した文字列を保存する関数(非同期)
  Future<void> _saveData() async {
    //保存箱を開ける
    final prefs = await SharedPreferences.getInstance();

    //TextFieldに入力した文字列を「save_str」というkeyで保存
    await prefs.setString('save_str', _con.text);

    setState(() {
      //入力内容の保存
      _saveStr = _con.text;
    });
  }

  //入力した文字列をMapに保存する関数(非同期)
  Future<void> _saveDataMap() async {
    //保存箱を開ける
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      //入力内容の保存
      _saveMap[DateTime.now()] = _con.text;
    });

    //現在の時刻(key)と入力内容(value)をMapに追加
    final Map<String,dynamic> strKeyMap = {};
    _saveMap.forEach((key,value){
      //「DateTime型」を「JSONが理解できるString」に変換
      strKeyMap[key.toIso8601String()] = value;
    });

    //JSONに変換
    final jsonStr = jsonEncode(strKeyMap);

    await prefs.setString('save_map', jsonStr);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(controller: _con),
          ElevatedButton(
            onPressed: () {
              //_saveData();
              _saveDataMap();
            },
            child: Text('文字列保存'),
          ),
          SizedBox(height: 32),
          Text('保存されている文字列(String)', style: TextStyle(fontSize: 24)),
          Text(_saveStr, style: TextStyle(fontSize: 36)),
        ],
      ),
    );
  }
}
