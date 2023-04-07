part of 'movie_details_cubit.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();
}

class MovieDetailsInitial extends MovieDetailsState {
  @override
  List<Object> get props => [];
}

class MovieDetailFetched extends MovieDetailsState {
  const MovieDetailFetched(this.movieDetailsModel);

  final MovieDetailsModel movieDetailsModel;

  @override
  List<Object?> get props => [movieDetailsModel];
}

