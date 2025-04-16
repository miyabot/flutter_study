import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('タスク追加画面'),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('タスクを入力してください',style: TextStyle(fontSize: 32),),
            SizedBox(height: 8,),
            SizedBox(
              width: 500,
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder()
                ),
              ),
            ),
            SizedBox(height: 8,),
            ElevatedButton(
              onPressed: (){
                context.pop(_controller.text);
              }, 
              child:Text('追加')
            )
          ],
        )
      )
    );
  }
}