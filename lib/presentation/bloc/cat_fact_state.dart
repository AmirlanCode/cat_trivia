import 'package:cat_trivia/model/cat_model.dart';

abstract class CatFactState {}

class FirstFactState extends CatFactState {}

class SearchingState extends CatFactState {}

class CatFactsFind extends CatFactState {
  final Cat facts;

  CatFactsFind(this.facts);
}

class ErrorState extends CatFactState {
  final String message;

  ErrorState(this.message);
}
