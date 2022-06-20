import 'package:cat_trivia/model/cat_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'cat_remote_data_source.g.dart';

@RestApi(baseUrl: 'https://cat-fact.herokuapp.com/')
abstract class CatRemoteDataSource {
  factory CatRemoteDataSource(Dio dio, {String baseUrl}) = _CatRemoteDataSource;

  @GET('facts/random')
  Future<Cat> getCat();
}
