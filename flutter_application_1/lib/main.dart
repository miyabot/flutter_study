import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_task.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const Test()),
    GoRoute(path: '/add', builder: (context, state) => const AddTask()),
  ],
);

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router);
  }
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final List<String> _list = [];
  final List<bool>_checkList = [];

  // 保存処理
Future<void> _saveTasks() async {
  //スマホ内のローカル保存箱（スマホの中に小さいメモ帳みたいな保存領域）を開く
  final prefs = await SharedPreferences.getInstance();

  //List<String>型のデータを'taskList'というキーで保存
  await prefs.setStringList('taskList', _list);

  //List<bool>型のデータをString型に変換してから'checkList'というキーで保存
  await prefs.setStringList('checkList', _checkList.map((e) => e.toString()).toList());
}

// 読み込み処理
Future<void> _loadTasks() async {
  //スマホ内の保存箱（SharedPreferences）を開く
  final prefs = await SharedPreferences.getInstance();

  //'taskList'というキーを使って保存したデータを取り出す。空(null)の場合は空リスト[]を返す
  final savedTasks = prefs.getStringList('taskList') ?? [];
  final savedChecks = prefs.getStringList('checkList') ?? [];

  setState(() {
    //念のためリスト内クリア
    _list.clear();
    _checkList.clear();

    //_list内に取り出したデータを全て入れる
    _list.addAll(savedTasks);

    //取り出した時点だとまだList<String>なのでList<bool>に戻す
    //一致していたらtrueが返ってくる
    _checkList.addAll(savedChecks.map((e) => e == 'true').toList());
  });
}

@override
void initState() {
  super.initState();
  _loadTasks(); // 起動時に保存データを読み込む
}

  @override
  Widget build(BuildContext context) {
    // 表示用にソートしたインデックスリストを作成
    List<int> sortedIndexes = List.generate(_list.length, (index) => index);
    debugPrint('ソート前:$sortedIndexes');

    sortedIndexes.sort((a, b) {

      // 完了していないタスクを前に、完了したタスクを後に
      //return 1の場合はaを後ろに、-1の場合はaを前に、0の場合は変更なし
      if (_checkList[a] && !_checkList[b]) return 1;
      if (!_checkList[a] && _checkList[b]) return -1;
      return 0;
    });

    debugPrint('ソート後:$sortedIndexes');

    return Scaffold(
      appBar: AppBar(title: Text('タスク管理アプリ')),
      body: ListView.builder(
        itemCount: sortedIndexes.length,
        itemBuilder: (context, i) {
          final index = sortedIndexes[i]; // ソート済みのインデックスで表示
          return ListTile(
            leading: Checkbox(
              value: _checkList[index],
              onChanged: (check) {
                setState(() {
                  _checkList[index] = check!;
                });
                _saveTasks();
              },
            ),
            title:
                !_checkList[index]
                    ? Text('タスク${index + 1}:${_list[index]}')
                    : Text(
                      'タスク${index + 1}:${_list[index]}',
                      style: TextStyle(decoration: TextDecoration.lineThrough),
                    ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _list.removeAt(index);
                  _checkList.removeAt(index);
                });
                _saveTasks();
              },
              icon: Icon(Icons.delete),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String? task = await context.push('/add');
          if (task != null) {
            setState(() {
              _list.add(task);
              _checkList.add(false);
            });
            _saveTasks();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
