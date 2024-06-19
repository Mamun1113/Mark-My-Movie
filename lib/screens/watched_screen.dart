import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mark_my_movie/movie_provider.dart';

class WatchedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder: (context, movieProvider, child) {
        return ListView.builder(
          itemCount: movieProvider.watched.length,
          itemBuilder: (context, index) {
            final movie = movieProvider.watched[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Image with fixed height and width
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
                    // Expanded column for text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Title
                          Text(
                            movie.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          // Subtitle with type, year, and IMDb ID
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
                    // Delete button
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red[500]),
                      onPressed: () {
                        movieProvider.removeWatched(movie);
                      },
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
