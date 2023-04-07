part of 'movie_search_cubit.dart';

abstract class MovieSearchState extends Equatable {
  const MovieSearchState();
}

class MovieSearchInitial extends MovieSearchState {
  @override
  List<Object> get props => [];
}

class MovieFetching extends MovieSearchState {
  @override
  List<Object> get props => [];
}

class SearchedMovieFetched extends MovieSearchState {
  const SearchedMovieFetched({required this.searchedMovieModel});

  final SearchedMovieModel searchedMovieModel;

  @override
  List<Object> get props => [searchedMovieModel];
}

class SearchedError extends MovieSearchState {
  const SearchedError({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object> get props => [];
}