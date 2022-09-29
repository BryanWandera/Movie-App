import 'package:http/http.dart';
import 'package:movie_app/custom_widgets/movie_card.dart';
import 'dart:convert';
import 'package:movie_app/screens/ListViewScreen.dart';
import 'package:movie_app/movie.dart';
import 'package:movie_app/screens/SearchScreen.dart';

var _apiKey = "2b764b4cdde517a682957fc1ff8fd5d2";

Future getMovies() async {
  var url = Uri.parse('https://api.themoviedb.org/3/discover/movie?api_key=$_apiKey&language=en-US&sort_by=popularity.desc&include_adult=true&include_video=false&page=1&with_watch_monetization_types=flatrate');

  Response response = await get(url);
  if (response.statusCode == 200) {
    //populate the list of random movies for list view screen
    Map<String, dynamic> map = json.decode(response.body);
    map["results"].forEach((result)=>{
      listOfMovies.add(MovieCard(
        id: result["id"],
        overview: result["overview"],
        title: result["title"],
        posterPath: result["poster_path"]
      ))
    });

    return listOfMovies;
  } else {

    return [];
  }
}

Future searchForMovie(String searchTerm) async {
  movieSearchResults.clear();
  var url = Uri.parse('https://api.themoviedb.org/3/search/movie?api_key=$_apiKey&query=$searchTerm');

  Response response = await get(url);
  var data = response.body;

  if (response.statusCode == 200) {
    //populate list of search results
    Map<String, dynamic> map = json.decode(response.body);
    map["results"].forEach((result)=>{
      movieSearchResults.add(MovieCard(
          id: result["id"],
          overview: result["overview"],
          title: result["title"],
          posterPath: result["poster_path"]
      ))
    });

    return movieSearchResults;
  } else {

    return [];
  }
}


