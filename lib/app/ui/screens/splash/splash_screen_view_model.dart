import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/app/navigation/app_route.dart';

class SplashScreenViewModel {
  void gotoMainScreen(BuildContext context){
    context.goNamed(AppRoute.main);
  }
}