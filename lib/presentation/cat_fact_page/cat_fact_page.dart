import 'package:cat_trivia/model/cat_model.dart';
import 'package:cat_trivia/presentation/bloc/cat_fact_state.dart';
import 'package:cat_trivia/presentation/bloc/cat_facts_cubit.dart';
import 'package:cat_trivia/presentation/cached_page/cached_page.dart';
import 'package:cat_trivia/resourses/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatFactPage extends StatelessWidget {
  const CatFactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CatFactsCubit>();
    Cat fact;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CatFactsCubit, CatFactState>(
            builder: (context, state) {
              if (state is FirstFactState) {
                return Column(
                  children: [
                    const Text(Strings.pressToStart),
                    ElevatedButton(
                      onPressed: () {
                        cubit.getFacts();
                      },
                      child: const Text(Strings.meow),
                    ),
                  ],
                );
              }
              if (state is SearchingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is CatFactsFind) {
                fact = state.facts;

                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 250,
                          width: 250,
                          child: Image.network('https://cataas.com/cat'),
                        ),
                        const SizedBox(height: 10.0),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              fact.text,
                              maxLines: 2,
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            cubit.getFacts();
                          },
                          child: const Text(Strings.oneMoreFact),
                        )
                      ],
                    ),
                  ),
                );
              }
              if (state is ErrorState) {
                return Text(state.message);
              }
              return const SizedBox();
            },
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CachedPage(),
                ),
              );
            },
            child: const Text(Strings.cachedPage),
          )
        ],
      ),
    );
  }
}
