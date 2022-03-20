import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokedex/routing/routes.dart';
import 'package:pokedex/ui/flows/search/search_page.dart';
import '../ui/flows/home/home.dart';

final routerProvider = Provider<Router>((ref) => Router());

class Router {
  final _router = FluroRouter();

  final _homeHandler = Handler(handlerFunc: (context, params) {
    return const HomePage();
  });

  final _searchHandler = Handler(handlerFunc: (context, params) {
    return const SearchPage();
  });

  void defineRoutes() {
    _router.define(Routes.home, handler: _homeHandler);
    _router.define(Routes.search, handler: _searchHandler);
  }

  Route<dynamic>? generateRouter(RouteSettings settings) =>
      _router.generator(settings);

  void navigateTo(BuildContext context, String path) {
    _router.navigateTo(context, path, transition: TransitionType.material);
  }
}
