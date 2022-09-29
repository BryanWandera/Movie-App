// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/provider.dart';
import 'package:movie_app/screens/SearchScreen.dart';
import 'package:movie_app/utilities/api_handler.dart';
import 'package:movie_app/custom_widgets/movie_card.dart';
import 'package:movie_app/movie.dart';
import 'package:provider/provider.dart';

List<MovieCard> listOfMovies = [];
bool loaded = false;



class ListViewScreen extends StatelessWidget {


  @override

  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
                      child: Text("Watch", style: headingStyle )
                  ),
                  // ignore: prefer_const_constructors
                  Container(
                    padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.05),
                    child: GestureDetector(
                      onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
                  },
                      child: Icon(Icons.search_rounded,
                        color: Colors.grey,
                        size: 32.0,),
                    ),
                  )
                ],
              ),

              Consumer<MovieProvider>(builder: (context, movie, child){

                if(listOfMovies.isEmpty){
                  getMovies().then((value) => movie.updateMovies(value));
                }

                return Column(children: movie.randomMovies);
              }),

              SizedBox(
                height: MediaQuery.of(context).size.height*0.05,
              )
            ],
          ),
        ),
      ),
    );
  }
}
