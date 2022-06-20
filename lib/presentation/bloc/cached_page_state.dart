import 'package:cat_trivia/model/cat_model.dart';

abstract class CachedPageState {}

class Empty extends CachedPageState {}

class DatabaseLoading extends CachedPageState {}

class DatabaseData extends CachedPageState {
  final List<Cat> cachedCats;

  DatabaseData(this.cachedCats);
}

class CachedErrorState extends CachedPageState {
  final String message;

  CachedErrorState(this.message);
}
