//Riverpodのインポート
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'input.g.dart';

//Stringの値を監視するProviderを作成
//Provider:アプリケーションの状態を管理するためのもの
//ref:状態の監視役
final selectNumProvider = StateProvider<int>((ref)=>0);

//riverpodとclassの組み合わせ
@Riverpod(keepAlive: true)
class TextProvider extends _$TextProvider {

    //build:必須
    @override
    String build() {
        //初期状態の設定
        return 'おはよう';
    }

    //削除関数
    void deleteText(){
        //現在の状態に対して空の文字列を代入
        state = '';
    }

    //入力した文字列をセット
    void setText(String text){
        state = text; 
    }
}