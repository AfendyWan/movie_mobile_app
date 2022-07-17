part of 'all_movies_bloc.dart';

enum AllMoviesStatus { initial, success, error, loading }

extension AllMoviesStatusX on AllMoviesStatus {
  bool get isInitial => this == AllMoviesStatus.initial;
  bool get isSuccess => this == AllMoviesStatus.success;
  bool get isError => this == AllMoviesStatus.error;
  bool get isLoading => this == AllMoviesStatus.loading;
}

class AllMoviesState extends Equatable {
  const AllMoviesState({
    this.status = AllMoviesStatus.initial,
    Movie? movies,
  }) : movies = movies ?? Movie.empty;

  final Movie movies;
  final AllMoviesStatus status;

  @override
  List<Object?> get props => [status, movies];

  AllMoviesState copyWith({
    Movie? movies,
    AllMoviesStatus? status,
  }) {
    return AllMoviesState(
      movies: movies ?? this.movies,
      status: status ?? this.status,
    );
  }
}
