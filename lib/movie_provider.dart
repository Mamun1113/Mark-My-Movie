import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:mark_my_movie/movie.dart';
import 'package:mark_my_movie/services/omdb_service.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> _wishlist = [];
  List<Movie> _watched = [];
  List<Movie> _favorite = [];

  List<Movie> _searchResults = [];
  String _searchQuery = '';

  List<Movie> get wishlist => _wishlist;
  List<Movie> get watched => _watched;
  List<Movie> get favorite => _favorite;
  List<Movie> get searchResults => _searchResults;
  String get searchQuery => _searchQuery;

  MovieProvider() {
    loadMovies();
  }

  void toggleWishlist(Movie movie) {
    movie.isWishlist = !movie.isWishlist;
    if (movie.isWishlist) {
      if (!_wishlist.contains(movie)) {
        _wishlist.add(movie);
      }
    } else {
      _wishlist.removeWhere((m) => m.imdbID == movie.imdbID);
    }
    saveMovies();
    notifyListeners();
  }

  void toggleWatched(Movie movie) {
    movie.isWatched = !movie.isWatched;
    if (movie.isWatched) {
      if (!_watched.contains(movie)) {
        _watched.add(movie);
      }
    } else {
      _watched.removeWhere((m) => m.imdbID == movie.imdbID);
    }
    saveMovies();
    notifyListeners();
  }

  void toggleFavorite(Movie movie) {
    movie.isFavorite = !movie.isFavorite;
    if (movie.isFavorite) {
      if (!_favorite.contains(movie)) {
        _favorite.add(movie);
      }
    } else {
      _favorite.removeWhere((m) => m.imdbID == movie.imdbID);
    }
    saveMovies();
    notifyListeners();
  }

  void saveMovies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('wishlist',
        jsonEncode(_wishlist.map((movie) => movie.toJson()).toList()));
    prefs.setString('watched',
        jsonEncode(_watched.map((movie) => movie.toJson()).toList()));
    prefs.setString('favorite',
        jsonEncode(_favorite.map((movie) => movie.toJson()).toList()));
  }

  void loadMovies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? wishlistString = prefs.getString('wishlist');
    String? watchedString = prefs.getString('watched');
    String? favoriteString = prefs.getString('favorite');

    if (wishlistString != null && wishlistString.isNotEmpty) {
      _wishlist = (jsonDecode(wishlistString) as List)
          .map((data) => Movie.fromJson(data))
          .toList();
    }
    if (watchedString != null && watchedString.isNotEmpty) {
      _watched = (jsonDecode(watchedString) as List)
          .map((data) => Movie.fromJson(data))
          .toList();
    }
    if (favoriteString != null && favoriteString.isNotEmpty) {
      _favorite = (jsonDecode(favoriteString) as List)
          .map((data) => Movie.fromJson(data))
          .toList();
    }

    notifyListeners();
  }

  void searchMovies(String query) async {
    if (query.isEmpty) return;
    _searchQuery = query;
    OmdbService _omdbService = OmdbService();
    List<Movie> results = await _omdbService.searchMovies(query);

    results = results.map((searchResult) {
      final existingMovie = _wishlist.firstWhere(
        (movie) => movie.title == searchResult.title,
        orElse: () => _watched.firstWhere(
          (movie) => movie.title == searchResult.title,
          orElse: () => _favorite.firstWhere(
            (movie) => movie.title == searchResult.title,
            orElse: () => searchResult,
          ),
        ),
      );
      return existingMovie;
    }).toList();

    _searchResults = results;
    notifyListeners();
  }
}
