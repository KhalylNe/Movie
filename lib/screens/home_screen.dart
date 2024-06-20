import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'movie_list_screen.dart';
import '../models/movie.dart';


class HomeScreen extends StatelessWidget {
  final List<Movie> movies = [
    Movie( 
      title: 'khalil test',
      genre: 'Comedy',
      actors: ['Med Khalil Neqach', 'Salam '],
      thumbnail : 'assets/cats/cat1.jpg' ,
      rating : 8.5,
      year : 2022,
      
    ),
    Movie(
      title: 'Action cat 1',
      genre: 'Action',
      actors: ['Action Cat 1', 'Action Cat 2'],
      thumbnail: 'assets/cats/cat2.jpg',
      rating : 8.0,
      year : 2024,
    ),
      Movie(
      title: 'Comedy cat 1',
      genre: 'Comedy',
      actors: ['Comedy Cat 1', 'Comedy Cat 2'],
      thumbnail: 'assets/cats/cat3.png',
      rating : 7.2,
      year : 2019,
    ),
      Movie(
      title: 'Action Cat 2',
      genre: 'Action',
      actors: ['Action Cat 1', 'Action Cat 2'],
      thumbnail: 'assets/cats/cat4.png',
      rating : 6.5,
      year : 2005,
    ),
      Movie(
      title: 'Comedy Cat2',
      genre: 'Comedy',
      actors: ['Comedy Cat 1', 'Comedy Cat 2'],
      thumbnail: 'assets/cats/cat5.jpg',
      rating : 9.0,
      year : 2021,
    ),
      Movie(
      title: 'Action Cat 3 ',
      genre: 'Action',
      actors: ['Action Cat 1', 'Action Cat 2'],
      thumbnail: 'assets/cats/cat1.jpg',
      rating : 8.8,
      year : 2020,
    ),
      Movie(
      title: 'Comedy Cat 3 ',
      genre: 'Comedy',
      actors: ['Comedy Cat 1', 'Comedy Cat 2'],
      thumbnail: 'assets/cats/cat1.jpg',
      rating : 7.8,
      year : 2014,
    ),
    
    
  ];
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie List App'),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieListScreen(movies: movies),
                  ), 
                );
              },
              child: Text('View Movies'),
            ),
          ],
        ),
      ),
    );
  }
}
