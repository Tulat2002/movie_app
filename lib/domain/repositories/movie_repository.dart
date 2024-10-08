import 'package:movie_app/domain/entities/movie_data.dart';

abstract class MovieRepository{
  Future<List<MovieData>> getTrendingMoviesOfThisWeek();
  Future<List<MovieData>> getTopRatedMovies();
}