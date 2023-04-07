import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_application/core/utils/hive_storage.dart';
import 'package:movie_application/feature/counter/data/models/movie_card_model.dart';
import 'package:movie_application/feature/counter/presentation/blocs/movie_cubit/movie_cubit.dart';

class MovieListWidget extends StatelessWidget {
  MovieListWidget(
      {super.key, required this.movieFetched, required this.onClick});

  final Function(int id) onClick;
  final MovieFetched movieFetched;

  final Set<MovieCardModel> movieCollection = {};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: movieFetched.moviesCard.length,
        itemBuilder: (context, index) {
          final movie = movieFetched.moviesCard[index];

          return GestureDetector(
            onTap: () => onClick(movie.id),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                  width: 190,
                  height: 400,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      width: 160,
                      fit: BoxFit.fill,
                      imageUrl:
                      'https://image.tmdb.org/t/p/w300${movie.posterPath}',
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        color: Colors.black87,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "${movie.title} ",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              maxLines: 4,
                            ),
                            Text(
                              (movie.releaseDate == "")
                                  ? ""
                                  : "(${movie.releaseDate.year})",
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              movie.overview,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        movieCollection.add(movie);
                        print("movie ${movieCollection.length}");
                        HiveUtils.storeMovies(movieCollection.toList());
                      },
                      icon: const Icon(
                        Icons.bookmark_border,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 15,
            childAspectRatio: 0.6),
      ),
    );
  }
}