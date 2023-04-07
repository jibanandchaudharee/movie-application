import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_application/feature/counter/data/models/searched_movie_model.dart';
import 'package:movie_application/feature/counter/presentation/blocs/movie_cubit/movie_search_cubit/movie_search_cubit.dart';
import 'package:movie_application/main.dart';

@RoutePage()
class MovieSearchScreen extends StatefulWidget {
  const MovieSearchScreen({Key? key}) : super(key: key);

  @override
  State<MovieSearchScreen> createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  late TextEditingController _textEditingController;
  late MovieSearchCubit _movieSearchCubit;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _movieSearchCubit = getIt<MovieSearchCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: TextFormField(
          controller: _textEditingController,
          autocorrect: false,
          decoration: const InputDecoration(hintText: 'Search Movie'),
          onFieldSubmitted: (userInput) {
            _movieSearchCubit.searchMovie(queryFromUi: userInput);
          },
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<MovieSearchCubit, MovieSearchState>(
              bloc: _movieSearchCubit,
              builder: (context, state) {
                if (state is MovieFetching) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SearchedMovieFetched) {
                  final SearchedMovieModel searchedMovie =
                      state.searchedMovieModel;

                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                          itemCount: searchedMovie.results.length,
                          itemBuilder: (context, index) {
                            final singleMovie = searchedMovie.results[index];

                            return Column(
                              children: [
                                Text(singleMovie.title),
                                Text(singleMovie.originalLanguage),
                                Text(singleMovie.overview),
                              ],
                            );
                          }),
                    ),
                  );
                } else if (state is SearchedError) {
                  return Center(
                    child: Text(state.errorMessage),
                  );
                }
                return const Center(
                  child: Text('You have not searched any movies yet'),
                );
              })
        ],
      ),
    );
  }
}