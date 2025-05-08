import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_study/input.dart';


//riverpod版のstateless
class A extends ConsumerWidget {
  const A({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //watch(監視し続ける)
    //textproviderの状態を監視し、変更されるたびに画面の更新をかける
    final text = ref.watch(textProvider);

    return Scaffold(
      body: Center(
        child: Text(text,style: TextStyle(fontSize: 64),),
      ),
    );
  }
}