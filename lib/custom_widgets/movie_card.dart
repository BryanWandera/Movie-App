// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/screens/ViewScreen.dart';

class MovieCard extends StatelessWidget {

  var id;
  var posterPath;
  var overview;
  var title;

  MovieCard({this.id, this.posterPath, this.overview, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewScreen(
          id: id,
          posterPath: posterPath,
          overview: overview,
          title: title,
        )));
      },
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.9 ,
            height: MediaQuery.of(context).size.width*0.6,
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.width*0.05 ),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: CachedNetworkImageProvider("https://image.tmdb.org/t/p/w500$posterPath")
                )

            ),

          ),
          Container(
            width: MediaQuery.of(context).size.width*0.7 ,
            child: Text(title, style: textOnImageStyle, overflow: TextOverflow.ellipsis,),
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.width*0.55, left: MediaQuery.of(context).size.width*0.05 ),
          )
        ],
      ),
    );
  }
}
