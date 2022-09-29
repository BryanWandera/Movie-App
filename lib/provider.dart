import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/custom_widgets/movie_card.dart';

class MovieProvider extends  ChangeNotifier{

  List<MovieCard> movieSearchResults = [];
  List<MovieCard> randomMovies = [];

  updateSearchResults(List<MovieCard> searchResults){
    movieSearchResults = searchResults;
    notifyListeners();
  }

  updateMovies(List<MovieCard> movieCards){
    randomMovies = movieCards;
    notifyListeners();
  }




}