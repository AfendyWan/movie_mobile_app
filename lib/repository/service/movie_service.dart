import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:movie/repository/models/movie.dart';
import 'package:movie/repository/models/result_error.dart';




class MovieService {
  MovieService({
    http.Client? httpClient,
    this.baseUrl = 'https://api.rawg.io/api',
  }) : _httpClient = httpClient ?? http.Client();

  final String baseUrl;
  final Client _httpClient;

  Uri getUrl({
    required String url,
    Map<String, String>? extraParameters,
  }) {
    final queryParameters = <String, String>{
      'key': dotenv.get('MOVIE_API_KEY')
    };
    if (extraParameters != null) {
      queryParameters.addAll(extraParameters);
    }

    return Uri.parse('$baseUrl/$url').replace(
      queryParameters: queryParameters,
    );
  }

  Future<Movie> getMovies() async {
    final response = await _httpClient.get(
      getUrl(url: 'movies'),
    );
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        return Movie.fromJson(
          json.decode(response.body),
        );
      } else {
        throw ErrorEmptyResponse();
      }
    } else {
      throw ErrorGettingMovies('Error getting movies');
    }
  }


}
