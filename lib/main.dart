import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokedex/routing/router.dart';
import 'package:pokedex/routing/routes.dart';
import 'package:pokedex/ui/flows/home/home.dart';

void main() {
  runApp(UncontrolledProviderScope(
      container: _initContainer(), child: const PokedexApp()));

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light));
}

ProviderContainer _initContainer() {
  final container = ProviderContainer(observers: [])..read(routerProvider);
  return container;
}

class PokedexApp extends HookConsumerWidget {
  const PokedexApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    useEffect(() {
      router.defineRoutes();
      return null;
    }, []);

    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: router.generateRouter,
      initialRoute: Routes.home,
    );
  }
}
