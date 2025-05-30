import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_study/input.dart';


//riverpod版のstateless
class C extends ConsumerWidget {
  const C({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //watch(監視し続ける)
    //textproviderの状態を監視し、変更されるたびに画面の更新をかける
    final text = ref.watch(textProviderProvider);

    return Scaffold(
      body: Center(
        child: Text(text,style: TextStyle(fontSize: 64),),
      ),
    );
  }
}