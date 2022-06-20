import 'package:cat_trivia/cat_data_source/cat_local_data_source.dart';
import 'package:cat_trivia/cat_data_source/cat_remote_data_source.dart';
import 'package:cat_trivia/network_info/network_info.dart';
import 'package:cat_trivia/presentation/bloc/cached_page_cubit.dart';
import 'package:cat_trivia/presentation/bloc/cat_facts_cubit.dart';
import 'package:cat_trivia/presentation/cat_fact_page/cat_fact_page.dart';
import 'package:cat_trivia/resourses/strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'cat_data_source/cat_repository.dart';
import 'model/cat_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CatAdapter());
  runApp(CatTrivia());
}

class CatTrivia extends StatelessWidget {
  CatTrivia({Key? key}) : super(key: key);

  final CatRepository _catRepository = CatRepository(
    catLocalDataSource: CatLocalDataSource(),
    catRemoteDataSource: CatRemoteDataSource(
      Dio(BaseOptions(contentType: 'application/json')),
    ),
    networkInfo: NetworkInfo(
      InternetConnectionChecker(),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CatFactsCubit(_catRepository),
        ),
        BlocProvider(
          create: (context) => CachedFactsCubit(_catRepository),
        )
      ],
      child: MaterialApp(
        title: Strings.catTrivia,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text(Strings.catFacts),
          ),
          body: const SafeArea(
            child: CatFactPage(),
          ),
        ),
      ),
    );
  }
}
