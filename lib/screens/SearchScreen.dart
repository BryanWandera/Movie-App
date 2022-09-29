// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movie_app/movie.dart';
import 'package:movie_app/custom_widgets/movie_card.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/provider.dart';
import 'package:movie_app/utilities/api_handler.dart';
import 'package:provider/provider.dart';

List<MovieCard> movieSearchResults = [];

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Consumer<MovieProvider>(
            builder: (context, search, child){
              
              return Column(

                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05, bottom: MediaQuery.of(context).size.width*0.05),
                      child: Text("Search", style: headingStyle )
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
                    child: TextField(

                      onSubmitted: (text) {
                        searchForMovie(text).then((value) => search.updateSearchResults(value));
                        // search.updateSearchResults(movieSearchResults);
                      },
                      decoration: InputDecoration(

                        border: OutlineInputBorder(),
                        hintText: 'Search Movie',

                      ),
                    ),
                  ),

                  Column(children: search.movieSearchResults),



                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.05,
                  )
                ],
              );
            },

                      )
        ),
      ),
    );
  }
}
