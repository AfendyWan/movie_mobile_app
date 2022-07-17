import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/repository/models/movie.dart';
import 'package:movie/repository/movie_repository.dart';


part 'all_movies_event.dart';
part 'all_movies_state.dart';

class AllMoviesBloc extends Bloc<AllMoviesEvent, AllMoviesState> {
  AllMoviesBloc({
    required this.movieRepository,
  }) : super(const AllMoviesState()) {
    on<GetMovies>(_mapGetMoviesEventToState);
  }

  final MovieRepository movieRepository;

  void _mapGetMoviesEventToState(
      GetMovies event, Emitter<AllMoviesState> emit) async {
    try {
      emit(state.copyWith(status: AllMoviesStatus.loading));
      final movies = await movieRepository.getMovies();
      emit(
        state.copyWith(
          status: AllMoviesStatus.success,
          movies: movies,
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: AllMoviesStatus.error));
    }
  }
}
