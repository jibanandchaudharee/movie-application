import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_application/feature/counter/data/data_source/movie_data_source.dart';
import 'package:movie_application/feature/counter/data/models/movie_card_model.dart';
import 'package:movie_application/feature/counter/data/repository/movie_repository.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());

  final MovieRepository _movieRepository = MovieRepository(MovieDataSource());

  /// calls [_movieRepository] methods passing the  [url]
  void getUpcomingMovies({required String apiUrl}) async {
    emit(MovieFetching());
    final moviesData = await _movieRepository.getUpcomingMovies(url: apiUrl);
    emit(MovieFetched(moviesData));
  }
}