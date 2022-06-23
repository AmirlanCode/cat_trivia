import 'package:cat_trivia/model/cat_model.dart';
import 'package:hive/hive.dart';

class CatLocalDataSource {
  List<Cat> a = [];
  Future<void> factsToCash(List<Cat> cats) async {
    try {
      var box = await Hive.openBox('catBox');
      await box.put('cats', cats);
    } catch (e) {
      throw Exception();
    }
  }

  Future<List<Cat>> getCats() async {
    try {
      var box = Hive.box('catBox');

      return await box.get('cat');
    } catch (e) {
      throw Exception();
    }
  }
}
