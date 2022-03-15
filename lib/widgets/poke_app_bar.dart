import 'package:flutter/material.dart';

import '../theme/pokedex_colors.dart';

class PokeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PokeAppBar(this.title, {Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;
  final String title;

  @override
  Widget build(BuildContext context) {
    const double _defaultSize = 90;

    return AppBar(
        title: const Text('Pokedex'),
        centerTitle: false,
        backgroundColor: PokedexColors.primary,
        flexibleSpace: Container(
          alignment: Alignment.bottomRight,
          child: const Image(
            image: AssetImage('assets/pokeball.png'),
            width: _defaultSize,
            height: _defaultSize,
            fit: BoxFit.fitWidth,
            alignment: Alignment.center,
            color: Colors.white,
          ),
        ));
  }
}
