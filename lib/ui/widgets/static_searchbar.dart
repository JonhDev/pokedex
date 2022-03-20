import 'package:flutter/material.dart';

import '../theme/pokedex_colors.dart';

class StaticSearchBar extends StatelessWidget {
  const StaticSearchBar(this.iconColor, {this.onTap, Key? key})
      : super(key: key);

  final GestureTapCallback? onTap;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 16, bottom: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: PokedexColors.grayOnWhite,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(children: [
            Icon(Icons.search, color: iconColor),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Buscar por nombre',
                style: TextStyle(color: PokedexColors.grayTextOnWhite),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
