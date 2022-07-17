import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/repository/movie_repository.dart';
import 'package:movie/repository/service/movie_service.dart';
import 'package:movie/ui/home/pages/home_layout.dart';
import 'package:movie/ui/home/widgets/all_movies_widget/bloc/all_movies_bloc.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFC5F5CB),
      body: RepositoryProvider(
        create: (context) => MovieRepository(service: MovieService()),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AllMoviesBloc>(
              create: (context) => AllMoviesBloc(
                movieRepository: context.read<MovieRepository>(),
              )..add(
                  GetMovies(),
                ),
            ),
          ],
          child: HomeLayout(),
        ),
      ),
    );
  }
}