import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/add_list.dart';
import 'package:riverpod_todo/my_list.dart';

void main() {
  runApp(ProviderScope(child: const Base()));
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:ToDoPage(),
    );
  }
}


class ToDoPage extends ConsumerStatefulWidget {
  const ToDoPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ToDoPageState();
}

class _ToDoPageState extends ConsumerState<ToDoPage> {
  @override
  Widget build(BuildContext context) {
    final list = ref.watch(myListProvider);
    return Scaffold(
      body:ListView.builder(
        itemCount: list.length,//要素数
        itemBuilder: (context,index){
          return ListTile(
            title:Text(list[index]),//要素の表示
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          final result = await Navigator.push(
            context, 
            MaterialPageRoute(builder: (context)=>AddList())
          );
          setState(() {
            list.add(result);
          });
        },
        child: Icon(Icons.add),
        
      ),
    );
  }
}
