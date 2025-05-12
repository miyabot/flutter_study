import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'my_list.g.dart';

@riverpod
class MyList extends _$MyList {

  //初期状態の設定
  @override
   Map<String,bool> build() {
    return {};
  }

  //追加関数
  void addResult(String str){
    //stateに新しいリストを作って代入
    //...(スプレッド演算子)：現在のリストの中身を全て展開
    //展開したリストの後ろにstrを追加
    state = {...state,str:false};
  }

  //削除関数
  void remove(String str){
    //..(カスケード演算子)：続けて処理を行う
    //リストを展開した後にremoveで削除を行う
    state = {...state}..remove(str);
  }

  //反転関数
  void toggle(String str){
    //!state[str]:反転
    state = {...state,str:!state[str]!}; 
  }
  
}