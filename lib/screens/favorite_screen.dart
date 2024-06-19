import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mark_my_movie/movie_provider.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder: (context, movieProvider, child) {
        return ListView.builder(
          itemCount: movieProvider.favorite.length,
          itemBuilder: (context, index) {
            final movie = movieProvider.favorite[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        movie.poster,
                        height: 120,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            movie.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "${movie.type} | ${movie.year} | ${movie.imdbID}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.list,
                            color:
                                movie.isWishlist ? Colors.green : Colors.grey,
                          ),
                          onPressed: () {
                            movieProvider.toggleWishlist(movie);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.check,
                            color:
                                movie.isWatched ? Colors.purple : Colors.grey,
                          ),
                          onPressed: () {
                            movieProvider.toggleWatched(movie);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.black),
                          onPressed: () {
                            movieProvider.toggleFavorite(movie);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
