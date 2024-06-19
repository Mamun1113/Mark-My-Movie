class Movie {
  final String title;
  final String poster;
  final String type;
  final String year;
  final String imdbID;
  bool isWishlist;
  bool isWatched;
  bool isFavorite;

  Movie({
    required this.title,
    required this.poster,
    required this.type,
    required this.year,
    required this.imdbID,
    this.isWishlist = false,
    this.isWatched = false,
    this.isFavorite = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'poster': poster,
      'type': type,
      'year': year,
      'imdbid': imdbID,
      'isWishlist': isWishlist,
      'isWatched': isWatched,
      'isFavorite': isFavorite,
    };
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    // Check if data is coming from the API or local storage
    bool isFromApi = json.containsKey('Title');

    return Movie(
      title: json[isFromApi ? 'Title' : 'title'],
      poster: json[isFromApi ? 'Poster' : 'poster'],
      type: json[isFromApi ? 'Type' : 'type'] ?? 'Unknown',
      year: json[isFromApi ? 'Year' : 'year'] ?? 'Unknown',
      imdbID: json[isFromApi ? 'imdbID' : 'imdbid'] ?? 'Unknown',
      isWishlist: json['isWishlist'] ?? false,
      isWatched: json['isWatched'] ?? false,
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}
