import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mark_my_movie/movie_provider.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<MovieProvider>(context, listen: false);
    _searchController.text = provider.searchQuery;
  }

  void _searchMovies() {
    final provider = Provider.of<MovieProvider>(context, listen: false);
    provider.searchMovies(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search movie',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onSubmitted: (value) {
              _searchMovies();
            },
          ),
        ),
        Expanded(
          child: Consumer<MovieProvider>(
            builder: (context, provider, child) {
              if (provider.searchResults.isEmpty) {
                return Center(child: Text('No results found.'));
              } else {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio:
                        0.63, // Adjust the aspect ratio to better fit the content
                  ),
                  itemCount: provider.searchResults.length,
                  itemBuilder: (context, index) {
                    final movie = provider.searchResults[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 5,
                      margin: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.network(
                            movie.poster,
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  movie.title,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[800],
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  movie.type +
                                      " | " +
                                      movie.year +
                                      " | " +
                                      movie.imdbID,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(
                                        Icons.list,
                                        color: movie.isWishlist
                                            ? Colors.green
                                            : Colors.grey,
                                      ),
                                      onPressed: () {
                                        provider.toggleWishlist(movie);
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.check,
                                        color: movie.isWatched
                                            ? Colors.purple
                                            : Colors.grey,
                                      ),
                                      onPressed: () {
                                        provider.toggleWatched(movie);
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.favorite,
                                        color: movie.isFavorite
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                      onPressed: () {
                                        provider.toggleFavorite(movie);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
