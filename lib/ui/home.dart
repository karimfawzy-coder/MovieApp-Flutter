import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/ui/movies-details.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> moviesList = Movie.getMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
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
      body: ListView.builder(
          itemCount: moviesList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
                children: <Widget>[
                  movieCard(moviesList[index], context),
                  Positioned(
                    top: 10.0,
                      child: movieImage(moviesList[index].images[1])),

                ], );
//            return Card(
//              color: Colors.blueGrey[900],
//              elevation: 10.0,
//              child: ListTile(
//                onTap: () => {
//                  Navigator.push(context, MaterialPageRoute(
//                      builder:(context) => MovieListViewDetails(
//                        movieName: moviesList[index].title,
//                        movie: moviesList[index],
//                      )
//                  ))},
//                title: Text(
//                  moviesList[index].title,
//                  style: TextStyle(
//                    color: Colors.white,
//                  ),
//                ),
//                subtitle: Text(
//                  moviesList[index].title,
//                  style: TextStyle(color: Colors.grey),
//                ),
//                leading: CircleAvatar(
//                  backgroundColor: Colors.blueGrey[700],
//                  child: Container(
//                    width: 500,
//                    height: 500,
//                    child: Padding(
//                      padding: const EdgeInsets.all(1.0),
//                    ),
//                    decoration: BoxDecoration(
//                      image: DecorationImage(
//                        image: NetworkImage(moviesList[index].images[0]),
//                        fit: BoxFit.fill,
//                      ),
//                      borderRadius: BorderRadius.circular(20.0),
//                    ),
//                  ),
//                ),
//                trailing: Text(
//                    '...',
//                style: TextStyle(
//                  color: Colors.white
//                ),),
//              ),
//            );
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.blueGrey[900],
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              left: 55.0,
              bottom: 8.0,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          movie.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Rating: ${movie.imdbRating} / 10",
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 12.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "Released: ${movie.released}",
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 14.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        movie.runtime,
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 14.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        movie.rated,
                        style: TextStyle(
                          color: Colors.grey[300] ,
                          fontSize: 14.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => MovieListViewDetails(movie: movie,movieName: movie.title,)
        ));
      },
    );
  }
  Widget movieImage(String imageUrl)
  {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl ?? 'https://mentalitch.com/wp-content/uploads/2020/01/5-Most-Incredible-Films-Ever-How-to-Find-the-Interesting-Film-to-See.jpg'),
          fit: BoxFit.cover
        )
      ),
    );
  }
}
