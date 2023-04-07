import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_application/core/db_constants.dart';
import 'package:movie_application/feature/counter/data/models/movie_card_model.dart';

class HiveUtils {
  static Box? _ourDataBase;

  static initDb() async {
    /// If you want to provide storage path to Hive
    // _ourDataBase = Hive.box('movieDB');
    // final dbDir = await getApplicationDocumentsDirectory();
    //Hive.init(dbDir.path);

    _ourDataBase = Hive.box('movieDB');
  }

  static setString(String key, String value) {
    _ourDataBase?.put(key, value);
  }

  static String getString(String key) {
    return _ourDataBase?.get(key);
  }

  /// ENCODING=> Object -> String
  static storeSingleMovie(MovieCardModel movie) {
    final Map<String, dynamic> movieJson = movie.toJson();
    final String encodedJsonString = jsonEncode(movieJson);

    //print("ENCODE MOVIE OBJECT ${encodedJson.toString()}");
    _ourDataBase?.put(DBConstants.singleMovieKey, encodedJsonString);
  }

  /// DECODING=> String -> Object
  static fetchSingleMovie() {
    final String storedMovieString =
    _ourDataBase?.get(DBConstants.singleMovieKey);
    final Map<String, dynamic> decodedJson = jsonDecode(storedMovieString);

    final MovieCardModel storedMovie = MovieCardModel.fromJson(decodedJson);
    print("fetched movie ${storedMovie.title}");
  }

  static storeMovies(List<MovieCardModel> movies) {
    _ourDataBase?.put('Movies', movies);
  }

  static List? fetchMovies() {
    final List? movies = _ourDataBase?.get('Movies')?? [];
    //print("MOVIES LENGTH ${movies.length}");
    return movies;
  }

  // static void deleteMovie(int id) {
  //   final movies = List<MovieCardModel>.from(fetchMovies());
  //   movies.removeWhere((element) => element.id == id);
  //   storeMovies(movies);
  //}
}