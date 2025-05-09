import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'my_list.g.dart';

@riverpod
class MyList extends _$MyList {

  //初期状態の設定
  @override
   List<String> build() {
    return [];
  }
  
}