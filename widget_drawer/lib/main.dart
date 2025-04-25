import 'package:flutter/material.dart';
import 'package:widget_drawer/tile1.dart';
import 'package:widget_drawer/tile2.dart';
import 'package:widget_drawer/tile3.dart';

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
      home: const MyHomePage(title: 'Drawerの基礎'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Drawerの作成にはAppBarが必要
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            //ヘッダーの作成
            DrawerHeader(
              child: Center(child: Text('Header部分')),
            ),
            ListTile(
              title: Text('リストタイル１'),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>const Tile1()) 
                );
              },
            ),
            ListTile(
              title: Text('リストタイル２'),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>const Tile2()) 
                );
              },
            ),
            ListTile(
              title: Text('リストタイル３'),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>const Tile3()) 
                );
              },
            ),
            
          ],
        ),
        
        
      ),
    );
  }
}
