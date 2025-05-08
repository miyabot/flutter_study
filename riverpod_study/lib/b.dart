import 'package:flutter/material.dart';

class B extends StatefulWidget {
  const B({super.key});

  @override
  State<B> createState() => _BState();
}

class _BState extends State<B> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextField(
          controller: _controller, //コントローラーの設定
          decoration: InputDecoration(
            border: OutlineInputBorder()
          ),
        )
      ),
    );
  }
}