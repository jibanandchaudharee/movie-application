import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_application/feature/counter/data/models/searched_movie_model.dart';
import 'package:movie_application/feature/counter/data/repository/movie_repository.dart';
import 'package:movie_application/main.dart';
part 'movie_search_state.dart';

class MovieSearchCubit extends Cubit<MovieSearchState> {
  MovieSearchCubit()
      : _movieRepository = getIt<MovieRepository>(),
        super(MovieSearchInitial());

  late final MovieRepository _movieRepository;

  void searchMovie({required String queryFromUi}) async {
    emit(MovieFetching());

    final SearchedMovieModel? movieModel =
    await _movieRepository.searchMovie(queryFromCubit: queryFromUi);

    _checkResultResponse(movieModel);
  }

  void _checkResultResponse(SearchedMovieModel? movieModel) {
    if (movieModel != null && movieModel.results.isNotEmpty) {
      emit(SearchedMovieFetched(searchedMovieModel: movieModel));
    } else {
      emit(const SearchedError(errorMessage: 'No Result Found'));
    }
  }
}