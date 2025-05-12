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
    //Map型のままだとListView.builderでエラーが出るので、List型に変換する
    //Map<String,bool> → List<Map<String,bool>>
    final entries = list.entries.toList();

    return Scaffold(
      body:ListView.builder(
        itemCount: entries.length,//要素数
        itemBuilder: (context,index){
          return ListTile(
            leading: IconButton(
              onPressed: (){
                ref.read(myListProvider.notifier).toggle(entries[index].key);
              }, 
              icon:(entries[index].value == false) ? 
                Icon(Icons.favorite) : 
                Icon(Icons.favorite,color: Colors.pink,)
            ),
            title:Text(entries[index].key),//要素の表示
            trailing: IconButton(
              onPressed: (){
                ref.read(myListProvider.notifier).remove(entries[index].key);
              }, 
              icon: Icon(Icons.delete)
            )
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          final result = await Navigator.push(
            context, 
            MaterialPageRoute(builder: (context)=>AddList())
          );
          ref.read(myListProvider.notifier).addResult(result);
        },
        child: Icon(Icons.add),
        
      ),
    );
  }
}
