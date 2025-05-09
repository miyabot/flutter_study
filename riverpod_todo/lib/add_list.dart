import 'package:flutter/material.dart';

class AddList extends StatefulWidget {
  const AddList({super.key});

  @override
  State<AddList> createState() => _AddListState();
}

class _AddListState extends State<AddList> {

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context,_controller.text);
              },
              child: Text('保存')
            )
          ],
        )
      ),
    );
  }
}