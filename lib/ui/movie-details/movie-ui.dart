import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';

class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;

  const MovieDetailsThumbnail({Key key, this.thumbnail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          alignment: Alignment.center ,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 170,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(thumbnail),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Icon(
              Icons.play_circle_outline,
              size: 100,
              color: Colors.white,
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[Color(0x00f5f5f5),Color(0xfff5f5f5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          height: 55,
        )

      ],
    );
  }
}
class MoviePosterWithDetails extends StatelessWidget {
  final Movie movie;

  const MoviePosterWithDetails({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          MoviePoster(posterUrl: movie.images[1],),
          SizedBox(width: 15,),
          Expanded(
            child:MovieHeaderDetails(movie: movie,),
          )
        ],
      ),
    );
  }
}


class MoviePoster extends StatelessWidget {
  final String posterUrl;

  const MoviePoster({Key key, this.posterUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(posterUrl),
              fit: BoxFit.cover,
            ),
          ),

        ),
      ),
    );
  }
}
class MovieHeaderDetails extends StatelessWidget {
  final Movie movie;

  const MovieHeaderDetails({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          movie.title,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text("${movie.year} . ${movie.genre} ".toUpperCase(),
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.grey[900]
          ),
        ),
        Text.rich(TextSpan(
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.grey[800],
            ),
            children:<TextSpan>[
              TextSpan(
                text: movie.plot,
              ),
              TextSpan(
                text: ('More..'),
                style: TextStyle(
                    color:Colors.indigoAccent
                ),

              )


            ]
        )
        )

      ],
    );
  }
}
class MovieDetailsCast extends StatelessWidget {
  final Movie movie;

  const MovieDetailsCast({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: <Widget>[
          MovieField(field: "Director", value: movie.director,),
          SizedBox(width: 4,height: 5,),
          MovieField(field: "Cast", value: movie.actors,),
          SizedBox(width: 4,height: 5,),
          MovieField(field: "Awards", value: movie.awards,)
        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {
  final String field;
  final String value;


  const MovieField({Key key, this.field, this.value}) : super(key: key);@override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("$field:",
          style: TextStyle(
              color: Colors.black87,
              fontSize: 15,
              fontWeight: FontWeight.bold
          ),) ,
        SizedBox(width: 3,),
        Expanded(
          child: Text("$value",
            style: TextStyle(
                color: Colors.grey[900],
                fontSize: 12,
                fontWeight: FontWeight.w400
            ),),
        )
      ],
    );
  }
}
class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12 , vertical: 10),
      child: Container(
        height: 0.7,
        color: Colors.grey[700],
      ),
    );
  }
}
class MovieDetailsMorePosters extends StatelessWidget {
  final List<String> posters;

  const MovieDetailsMorePosters({Key key, this.posters}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'More Posters for this Movie'.toUpperCase(),
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.grey[800],
              fontSize: 14
          ),
        ),
        HorizontalLine(),
        Container(
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder:(context,index)=>SizedBox(width: 8,),   // separate between items
            itemCount: posters.length,
            itemBuilder: (context,index) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 20,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(posters[index]),
                        fit: BoxFit.cover
                    )
                ),
              ) ,
            ),    //building item //4akl al item

          ),
        )
      ],
    );
  }
}