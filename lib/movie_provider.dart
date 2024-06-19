
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
      _wishlist.add(movie);
    } else {
      _wishlist.remove(movie);
    }
    saveMovies();
    notifyListeners();
  }

  void toggleWatched(Movie movie) {
    movie.isWatched = !movie.isWatched;
    if (movie.isWatched) {
      _watched.add(movie);
    } else {
      _watched.remove(movie);
    }
    saveMovies();
    notifyListeners();
  }

  void toggleFavorite(Movie movie) {
    movie.isFavorite = !movie.isFavorite;
    if (movie.isFavorite) {
      _favorite.add(movie);
    } else {
      _favorite.remove(movie);
    }
    saveMovies();
    notifyListeners();
  }

  void removeFavorite(Movie movie) {
    movie.isFavorite = false;
    _favorite.remove(movie);
    saveMovies();
    notifyListeners();
  }

  void removeWatched(Movie movie) {
    movie.isWatched = false;
    _watched.remove(movie);
    saveMovies();
    notifyListeners();
  }

  void removeWishlist(Movie movie) {
    movie.isWishlist = false;
    _wishlist.remove(movie);
    saveMovies();
    notifyListeners();
  }

  void saveMovies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('wishlist', jsonEncode(_wishlist.map((movie) => movie.toJson()).toList()));
    prefs.setString('watched', jsonEncode(_watched.map((movie) => movie.toJson()).toList()));
    prefs.setString('favorite', jsonEncode(_favorite.map((movie) => movie.toJson()).toList()));
  }

  void loadMovies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? wishlistString = prefs.getString('wishlist');
    String? watchedString = prefs.getString('watched');
    String? favoriteString = prefs.getString('favorite');

    if (wishlistString != null && wishlistString.isNotEmpty) {
      _wishlist = (jsonDecode(wishlistString) as List).map((data) => Movie.fromJson(data)).toList();
    }
    if (watchedString != null && watchedString.isNotEmpty) {
      _watched = (jsonDecode(watchedString) as List).map((data) => Movie.fromJson(data)).toList();
    }
    if (favoriteString != null && favoriteString.isNotEmpty) {
      _favorite = (jsonDecode(favoriteString) as List).map((data) => Movie.fromJson(data)).toList();
    }

    notifyListeners();
  }

  void searchMovies(String query) async {
    if (query.isEmpty) return;
    _searchQuery = query;
    OmdbService _omdbService = OmdbService();
    List<Movie> results = await _omdbService.searchMovies(query);
    
    // Sync the search results with the existing lists
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