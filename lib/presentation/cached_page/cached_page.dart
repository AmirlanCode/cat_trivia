import 'package:cat_trivia/presentation/bloc/cached_page_cubit.dart';
import 'package:cat_trivia/presentation/bloc/cached_page_state.dart';
import 'package:cat_trivia/presentation/cached_page/widgets/data_widget.dart';
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
            return DataWidget(facts: facts);
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
