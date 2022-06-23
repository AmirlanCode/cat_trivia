import 'package:cat_trivia/model/cat_model.dart';
import 'package:cat_trivia/presentation/bloc/cat_facts_cubit.dart';
import 'package:cat_trivia/resourses/strings.dart';
import 'package:cat_trivia/resourses/styles.dart';
import 'package:flutter/material.dart';

class CachedDataWidget extends StatelessWidget {
  const CachedDataWidget({
    Key? key,
    required this.fact,
    required this.cubit,
  }) : super(key: key);

  final Cat fact;
  final CatFactsCubit cubit;

  @override
  Widget build(BuildContext context) {
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
                child: Text(fact.text, maxLines: 2, style: Styles.catStyle),
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
}
