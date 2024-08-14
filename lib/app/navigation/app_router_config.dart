import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/app/navigation/app_route.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/app/ui/screens/main/main_screen.dart';
import 'package:movie_app/app/ui/screens/main/main_screen_view_model.dart';
import 'package:movie_app/app/ui/screens/splash/splash_screen.dart';
import 'package:movie_app/app/ui/screens/splash/splash_screen_view_model.dart';
import 'package:movie_app/core/di/inject.dart';
import 'package:movie_app/domain/bloc/home_bloc.dart';

class AppRouterConfig {
  late final GoRouter router = GoRouter(
    routes: _routes,
    initialLocation: AppRoute.root
  );

  void dispose(){

  }

  late final _routes = <RouteBase>[
    GoRoute(
      path: '/',
      name: AppRoute.root,
      builder: (context, state) => SplashScreen(
            viewModel: SplashScreenViewModel(),
        ),
    ),
    
    GoRoute(
        path: '/main',
        name: AppRoute.main ,
        builder: (_, __) => BlocProvider(
          create: (_) => HomeBloc(inject()),
            child: MainScreen(
              viewModel: MainScreenViewModel(),
            ),
        ),
    )
  ];
}