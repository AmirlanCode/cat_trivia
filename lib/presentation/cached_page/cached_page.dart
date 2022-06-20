import 'package:cat_trivia/presentation/bloc/cached_page_cubit.dart';
import 'package:cat_trivia/presentation/bloc/cached_page_state.dart';
import 'package:cat_trivia/resourses/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CachedPage extends HookWidget {
  const CachedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CachedFactsCubit>();
    useEffect(() {
      cubit.getFromDatabase();
      return null;
    }, []);
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.cachedData),
      ),
      body: BlocBuilder<CachedFactsCubit, CachedPageState>(
        builder: (context, state) {
          if (state is Empty) {
            return const Center(
              child: Text(Strings.cachedData),
            );
          }
          if (state is DatabaseLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is DatabaseData) {
            final facts = state.cachedCats;
            return Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: ListView.builder(
                itemCount: state.cachedCats.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            facts[index].text,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  );
                },
              ),
            );
          }
          if (state is CachedErrorState) {
            return Center(
              child: Text(state.message),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

// //Cached Page
// Future<List<Cat>> cached() async {
//   final catBox = await Hive.openBox('catBox');
//   final facts = catBox.values;
//   return facts.first;
// }

// FutureBuilder<List<Cat>>(
// future: cached(),
// builder: (context, snapshot) {
// if (snapshot.hasData) {
// return ListView.builder(
// itemCount: snapshot.data?.length,
// itemBuilder: (context, index) {
// return Padding(
// padding: const EdgeInsets.all(10.0),
// child: DecoratedBox(
// decoration: BoxDecoration(
// color: Colors.red,
// borderRadius: BorderRadius.circular(10.0),
// ),
// child: Padding(
// padding: const EdgeInsets.all(10.0),
// child: Text(snapshot.data![index].text),
// ),
// ),
// );
// },
// );
// }
// return const CircularProgressIndicator();
// }),
