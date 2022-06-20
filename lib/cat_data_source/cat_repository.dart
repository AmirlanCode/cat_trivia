import 'package:cat_trivia/cat_data_source/cat_local_data_source.dart';
import 'package:cat_trivia/model/cat_model.dart';
import 'package:cat_trivia/network_info/network_info.dart';

import 'cat_remote_data_source.dart';

class CatRepository {
  final CatLocalDataSource catLocalDataSource;
  CatRemoteDataSource catRemoteDataSource;
  final NetworkInfo networkInfo;

  CatRepository({
    required this.catLocalDataSource,
    required this.catRemoteDataSource,
    required this.networkInfo,
  });

  final List<Cat> cats = [];

  Future<Cat> getCatSource() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCat = await catRemoteDataSource.getCat();
        cats.add(remoteCat);
        catLocalDataSource.factsToCash(cats);
        return remoteCat;
      } catch (e) {
        throw Exception();
      }
    } else {
      try {
        final localCat = await catLocalDataSource.getCats();

        return localCat as Cat;
      } catch (e) {
        throw Exception();
      }
    }
  }
}
