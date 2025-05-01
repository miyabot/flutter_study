import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:SizeSample(),
    );
  }
}

class SizeSample extends StatelessWidget {
  const SizeSample({super.key});

  @override
  Widget build(BuildContext context) {
    //スクリーンサイズの取得(縦、横)
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width; //横幅
    double screenHeight = screenSize.height; //縦幅
    debugPrint('横幅：$screenWidth');
    debugPrint('縦幅：$screenHeight');

    return Scaffold(
      body: Center(
        //見た目を変えることが出来る箱
        child:Container(
          width: screenWidth * 0.9,
          height: screenHeight * 0.95,
          color: Colors.red,
        )
      ),
    );
  }
}

