import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_study/input.dart';


//riverpod版のstateful
class B extends ConsumerStatefulWidget {
  const B({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BState();
}

class _BState extends ConsumerState<B> {
  final TextEditingController _controller = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    //ref.watch(textProviderProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller, //コントローラーの設定
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
            ),
            ElevatedButton(
              onPressed: (){
                //入力内容の保存
                //read(単発取得)：現在の値が取得できる
                ref.read(textProviderProvider.notifier).setText(_controller.text);
              }, 
              child: Text('保存')
            )
          ],
        )
      ),
    );
  }
}
