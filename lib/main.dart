import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_application/core/router.dart';
import 'package:movie_application/core/utils/hive_storage.dart';
import 'package:movie_application/core/utils/shared_pref.dart';
import 'package:movie_application/feature/counter/data/data_source/movie_data_source.dart';
import 'package:movie_application/feature/counter/data/models/movie_card_model.dart';
import 'package:movie_application/feature/counter/data/repository/movie_repository.dart';
import 'package:movie_application/feature/counter/presentation/blocs/movie_cubit/movie_cubit.dart';
import 'package:movie_application/feature/counter/presentation/blocs/movie_cubit/movie_details_cubit/movie_details_cubit.dart';
import 'package:movie_application/feature/counter/presentation/blocs/movie_cubit/movie_search_cubit/movie_search_cubit.dart';

GetIt getIt = GetIt.instance;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieCardAdapter());
  await Hive.openBox('movieDB');
  getIt.registerLazySingleton<MovieSearchCubit>(() => MovieSearchCubit());
  getIt.registerLazySingleton<MovieCubit>(() => MovieCubit());
  getIt.registerLazySingleton<MovieDetailsCubit>(() => MovieDetailsCubit());
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<AppRouter>(() => AppRouter());
  getIt.registerLazySingleton<MovieRepository>(
          () => MovieRepository(MovieDataSource()));
  PreferenceUtils.init();
  HiveUtils.initDb();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _appRouter = getIt<AppRouter>();
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }
}