import 'package:cat_trivia/cat_data_source/cat_repository.dart';
import 'package:cat_trivia/presentation/bloc/cached_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class CachedFactsCubit extends Cubit<CachedPageState> {
  final CatRepository catRepository;

  CachedFactsCubit(this.catRepository) : super(Empty());

  Future<void> getFromDatabase() async {
    emit(DatabaseLoading());

    try {
      final box = await Hive.openBox('catBox');
      final facts = await box.values.first;

      if (facts == null) {
        emit(CachedErrorState('Null'));
      }
      emit(DatabaseData(facts));
    } catch (e) {
      emit(
        CachedErrorState('$e'),
      );
      if ('$e'.contains('List<dynamic>')) {
        emit(CachedErrorState('Pusto'));
      }
    }
  }
}
