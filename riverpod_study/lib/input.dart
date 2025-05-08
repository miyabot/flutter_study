//Riverpodのインポート
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'input.g.dart';

//Stringの値を監視するProviderを作成
//Provider:アプリケーションの状態を管理するためのもの
//ref:状態の監視役
final textProvider = StateProvider<String>((ref)=>'');
final selectNumProvider = StateProvider<int>((ref)=>0);

//riverpodとclassの組み合わせ
@riverpod
class TextProvider extends _$TextProvider {

    //build:必須
    @override
    String build() {
        //初期状態の設定
        return '';
    }

    //削除関数
    void deleteText(){

    }
}