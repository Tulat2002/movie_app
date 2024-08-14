
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/mappers/movie_mapper.dart';

import '../../domain/entities/movie_data.dart';
import '../../domain/repositories/movie_repository.dart';
import '../remote/movie_api.dart';

@Singleton(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  const MovieRepositoryImpl(this._movieApi);

  final MovieApi _movieApi;

  @override
  Future<List<MovieData>> getTrendingMoviesOfThisWeek() async {
    final paginatedResponse = await _movieApi.getTrendingMoviesOfThisWeek();
    final movies = paginatedResponse.results;
    final data = movies.map((movie) => movie.toData()).toList();
    return data;
  }

  @override
  Future<List<MovieData>> getTopRatedMovies() async {
    final paginatedResponse = await _movieApi.getTopRatedMovies();
    final movies = paginatedResponse.results;
    final data = movies.map((movie) => movie.toData()).toList();
    return data;
  }
}