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
      debugShowCheckedModeBanner: false, //Debugの帯を消す
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  //final List entries= ['A','B','C']だとあらゆる方の要素を追加できてしまう
  final List<String>entries=<String>['【緊急事態】筋肉がはちきれました...','【緊急事態】筋肉に自我が芽生え始めました！','【速報】体育の教師になりました！'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('マッソウチャンネル'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        actions:const [
          Icon(Icons.ondemand_video_outlined),
          SizedBox(width: 16),
          Icon(Icons.search),
          SizedBox(width: 16),
          Icon(Icons.menu),
          SizedBox(width: 16),
        ],
      ),
      body: Container(
        color: Colors.black,
        child:ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount:entries.length,
          itemBuilder: (BuildContext context,int index)
          {
            return Container(
              height:100,
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Image.network(
                    'https://blog.kobedenshi.ac.jp/wp-content/uploads/2016/06/Hayabara-150x150.jpg',
                    ),
                    //余白作成
                    const SizedBox(
                      width:16,
                    ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entries[index],
                          style:const TextStyle(
                          color: Colors.white,
                          ),
                        ),
                        const Text(
                          '1億2500万回視聴 5日前',
                          style: TextStyle(
                            color: Colors.grey,fontSize: 16
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            );
          },
        ),
      ),
    );
  }
}