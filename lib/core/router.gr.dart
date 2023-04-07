import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:movie_application/feature/counter/data/models/movie_details_model.dart'
as _i7;
import 'package:movie_application/feature/counter/presentation/screens/bookmarked_movie_screen.dart'
as _i4;
import 'package:movie_application/feature/counter/presentation/screens/movie_detail_screen.dart'
as _i1;
import 'package:movie_application/feature/counter/presentation/screens/movie_home_screen.dart'
as _i2;
import 'package:movie_application/feature/counter/presentation/screens/movie_search_screen.dart'
as _i3;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    MovieDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.MovieDetailScreen(
          key: args.key,
          movieDetailsModel: args.movieDetailsModel,
        ),
      );
    },
    MovieHomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MovieHomeScreen(),
      );
    },
    MovieSearchRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MovieSearchScreen(),
      );
    },
    BookmarkedMovieRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.BookmarkedMovieScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.MovieDetailScreen]
class MovieDetailRoute extends _i5.PageRouteInfo<MovieDetailRouteArgs> {
  MovieDetailRoute({
    _i6.Key? key,
    required _i7.MovieDetailsModel movieDetailsModel,
    List<_i5.PageRouteInfo>? children,
  }) : super(
    MovieDetailRoute.name,
    args: MovieDetailRouteArgs(
      key: key,
      movieDetailsModel: movieDetailsModel,
    ),
    initialChildren: children,
  );

  static const String name = 'MovieDetailRoute';

  static const _i5.PageInfo<MovieDetailRouteArgs> page =
  _i5.PageInfo<MovieDetailRouteArgs>(name);
}

class MovieDetailRouteArgs {
  const MovieDetailRouteArgs({
    this.key,
    required this.movieDetailsModel,
  });

  final _i6.Key? key;

  final _i7.MovieDetailsModel movieDetailsModel;

  @override
  String toString() {
    return 'MovieDetailRouteArgs{key: $key, movieDetailsModel: $movieDetailsModel}';
  }
}

/// generated route for
/// [_i2.MovieHomeScreen]
class MovieHomeRoute extends _i5.PageRouteInfo<void> {
  const MovieHomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
    MovieHomeRoute.name,
    initialChildren: children,
  );

  static const String name = 'MovieHomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MovieSearchScreen]
class MovieSearchRoute extends _i5.PageRouteInfo<void> {
  const MovieSearchRoute({List<_i5.PageRouteInfo>? children})
      : super(
    MovieSearchRoute.name,
    initialChildren: children,
  );

  static const String name = 'MovieSearchRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.BookmarkedMovieScreen]
class BookmarkedMovieRoute extends _i5.PageRouteInfo<void> {
  const BookmarkedMovieRoute({List<_i5.PageRouteInfo>? children})
      : super(
    BookmarkedMovieRoute.name,
    initialChildren: children,
  );

  static const String name = 'BookmarkedMovieRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}