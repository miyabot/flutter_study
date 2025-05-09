import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_study/a.dart';
import 'package:riverpod_study/b.dart';
import 'package:riverpod_study/c.dart';
import 'package:riverpod_study/input.dart';

void main() {
  //ProviderScope:監視の範囲
  runApp(ProviderScope(child: const Base()));
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:RiverStudy()
    );
  }
}


class RiverStudy extends ConsumerStatefulWidget {
  const RiverStudy({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RiverStudyState();
}

class _RiverStudyState extends ConsumerState<RiverStudy> {

  //選択中のアイテムを管理
  //final int _selectIndex = 0;

  //ページを管理
  final List<Widget> _page = [
    A(),
    B(),
    C(),
  ];

  @override
  Widget build(BuildContext context) {

    //リアルタイムで更新する必要があるため、build内で記載する
    final selectNum = ref.watch(selectNumProvider);

    return Scaffold(

      body:_page[selectNum],

      //画面下部のバー
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: selectNum,//選択中のアイテム番号の指定

        //index:選択されたアイテムの番号が入っている
        onTap: (index){
          ref.read(selectNumProvider.notifier).state = index;
        },

        //アイコンの設定
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.edit),label: 'edit'),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: 'search'),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //削除
          ref.read(textProviderProvider.notifier).deleteText();
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}