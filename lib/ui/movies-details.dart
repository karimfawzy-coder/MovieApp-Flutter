import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/ui/movie-details/movie-ui.dart';

class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;
  const MovieListViewDetails({Key key, this.movieName, this.movie}) : super(key: key); // to receive data from another route
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
        title: Text(
        'Movies',
        style: TextStyle(
        letterSpacing: 2.0,
    ),
    ),
    backgroundColor: Colors.grey[900],
    centerTitle: true,
    ),
      body: ListView(
        children: <Widget>[
          MovieDetailsThumbnail(thumbnail: movie.images[0],),
          MoviePosterWithDetails(movie: movie,),
          HorizontalLine(),
          MovieDetailsCast(movie: movie,),
          HorizontalLine(),
          MovieDetailsMorePosters(posters: movie.images,)
        ],
      ),
    );
  }
}







  

