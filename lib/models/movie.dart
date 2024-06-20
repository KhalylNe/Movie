
class Movie {
  final String title;
  final String genre;
  final List<String> actors;
  final String thumbnail;
  final double rating;
  final double year;

  Movie( {
    required this.title,
    required this.genre,
    required this.actors,
    required this.thumbnail,
    required this.rating,
    required this.year,
  });
  String infoMovie(){
    return 'Title: $title, Genre: $genre, Rating: $rating, Year: $year, Actors: $actors';
  }
}
