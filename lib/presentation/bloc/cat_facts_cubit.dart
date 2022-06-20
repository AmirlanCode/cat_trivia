import 'package:cat_trivia/cat_data_source/cat_repository.dart';
import 'package:cat_trivia/presentation/bloc/cat_fact_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatFactsCubit extends Cubit<CatFactState> {
  final CatRepository _catRepository;

  CatFactsCubit(this._catRepository) : super(FirstFactState());

  Future<void> getFacts() async {
    emit(SearchingState());

    try {
      final facts = await _catRepository.getCatSource();

      if (facts == null) {
        emit(ErrorState('Null'));
      }
      emit(CatFactsFind(facts));
    } catch (e) {
      emit(
        ErrorState(e.toString()),
      );
    }
  }
}
