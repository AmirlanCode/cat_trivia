import 'package:cat_trivia/model/cat_model.dart';
import 'package:hive/hive.dart';

class CatLocalDataSource {
  List<Cat> a = [];
  Future<void> factsToCash(List<Cat> cats) async {
    var box = await Hive.openBox('catBox');
    await box.put('cats', cats);
  }

  Future<List<Cat>> getCats() async {
    var box = Hive.box('catBox');

    return await box.get('cat');
  }
}
