import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_application/feature/counter/data/models/movie_details_model.dart';
import 'package:movie_application/feature/counter/data/repository/movie_repository.dart';
import 'package:movie_application/main.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(MovieDetailsInitial());
  final MovieRepository _movieRepository = getIt<MovieRepository>();

  void getMovieDetails({required int movieId})async{

    final movieDetails =await _movieRepository.getMovieDetails(movieId: movieId);

    if(movieDetails!=null){
      emit(MovieDetailFetched(movieDetails));
    }
  }
}