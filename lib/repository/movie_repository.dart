
import 'package:movie/repository/models/movie.dart';
import 'package:movie/repository/service/movie_service.dart';

class MovieRepository {
  const MovieRepository({
    required this.service,
  });
  final MovieService service;

  Future<Movie> getMovies() async => service.getMovies();

}
