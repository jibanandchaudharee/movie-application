import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:movie_application/core/utils/hive_storage.dart';
import 'package:movie_application/core/utils/shared_pref.dart';
import 'package:movie_application/feature/counter/data/models/movie_details_model.dart';

@RoutePage()
class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({Key? key, required this.movieDetailsModel})
      : super(key: key);

  final MovieDetailsModel movieDetailsModel;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  String appBarTitle = '';

  @override
  void initState() {
    super.initState();

    //TO handle nullable cases
    //NOT GOOD PRACTICES

    //appBarTitle = getAppBarTitleFromHive();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Text(widget.movieDetailsModel.title),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Text(widget.movieDetailsModel.overview),
          )
        ],
      ),
    );
  }
}

String? getAppBarTitle() {
  return PreferenceUtils.getString('titleBarKey');
}

//String getAppBarTitleFromHive() {
  //return HiveUtils.getString('titleBarKey');
//}
