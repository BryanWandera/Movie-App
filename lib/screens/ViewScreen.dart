// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app/constants.dart';

class ViewScreen extends StatelessWidget {

  var posterPath;
  var id;
  var title;
  var overview;
  ViewScreen({this.posterPath, this.id, this.title, this.overview});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.45,
                    decoration: BoxDecoration(
                        color: Colors.grey,

                        image: DecorationImage(
                          fit: BoxFit.cover,
                            image: CachedNetworkImageProvider("https://image.tmdb.org/t/p/w500$posterPath")
                        )
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.width*0.15, left: MediaQuery.of(context).size.width*0.05),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back,
                          color: Colors.white,
                          
                          size: 24.0,),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width*0.8,
                            child: Text(title, style: textOnImageStyle, overflow: TextOverflow.clip,))
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width*0.15 ,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05 ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Overview", textAlign: TextAlign.left, style: headingStyle,),
                    Text(overview, style: bodyTextStyle,)
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
