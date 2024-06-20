

import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieListScreen extends StatefulWidget {
  final List<Movie> movies;

  MovieListScreen({required this.movies});

  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  List<Movie> filteredMovies = [];
  String searchQuery = '';
  String selectedGenre = 'All';

  @override
  void initState() {
    super.initState();
    filteredMovies = widget.movies;
  }

  void filterMovies() {
    setState(() {
      filteredMovies = widget.movies.where((movie) {
        bool matchesGenre = selectedGenre == 'All' || movie.genre == selectedGenre;
        bool matchesQuery = searchQuery.isEmpty ||
            movie.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
            movie.actors.any((actor) => actor.toLowerCase().contains(searchQuery.toLowerCase()));
        return matchesGenre && matchesQuery;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: MovieSearchDelegate(widget.movies));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedGenre,
              onChanged: (value) {
                setState(() {
                  selectedGenre = value!;
                  filterMovies();
                });
              },
              items: ['All', 'Comedy', 'Action']
                  .map((genre) => DropdownMenuItem(
                        value: genre,
                        child: Text(genre),
                      ))
                  .toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredMovies.length,
              itemBuilder: (context, index) {
                final movie = filteredMovies[index];
                return GestureDetector(
                   onTap: () => Showinfo(context ,index ) ,
                  child: ListTile(
                    leading: Image.asset(movie.thumbnail, fit: BoxFit.cover, width: 130, height: 600,),
                    title: Text(movie.title),
                    subtitle: Text(movie.genre),
                    
                  ),
                );
              },
            ),
          ),
          
        ],
      ),
    );
  }
  void Showinfo(BuildContext context, int index){
    showDialog(
      context: context,
      builder: (context){
      
        return AlertDialog(
            title: Text(" ${filteredMovies[index].title} "),
          content: Text("${filteredMovies[index].infoMovie()} "),
          
        );
      },
    );
  }
}

class MovieSearchDelegate extends SearchDelegate {
  final List<Movie> movies;

  MovieSearchDelegate(this.movies);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = movies.where((movie) {
      return movie.title.toLowerCase().contains(query.toLowerCase()) ||
          movie.actors.any((actor) => actor.toLowerCase().contains(query.toLowerCase()));
    }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final movie = results[index];
        return ListTile(
          leading: Image.asset(movie.thumbnail, fit: BoxFit.cover, width:250),
          title: Text(movie.title),
          subtitle: Text(movie.genre),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = movies.where((movie) {
      return movie.title.toLowerCase().contains(query.toLowerCase()) ||
          movie.actors.any((actor) => actor.toLowerCase().contains(query.toLowerCase()));
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final movie = suggestions[index];
        return ListTile(
          leading: Image.asset(movie.thumbnail, fit: BoxFit.cover, width: 50),
          title: Text(movie.title),
          subtitle: Text(movie.genre),
        );
      },
    );
  }
}
