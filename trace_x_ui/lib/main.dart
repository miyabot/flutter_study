import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> tweets = [
    {
      "user": "Kanta",
      "content": "FlutterでXのUIを再現してみた！ #FlutterDev",
    },
    {
      "user": "TechGuru",
      "content": "Jetpack ComposeとFlutter、どちらが優れているか考察中…",
    },
    {
      "user": "AI_Buddy",
      "content": "CopilotはFlutterの開発サポートもできるよ！",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("X - Timeline"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: tweets.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(tweets[index]["user"] ?? ""),
              subtitle: Text(tweets[index]["content"] ?? ""),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "ホーム"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "検索"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "通知"),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: "メッセージ"),
        ],
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}