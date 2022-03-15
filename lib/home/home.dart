import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pokedex/theme/pokedex_colors.dart';
import 'package:pokedex/widgets/poke_app_bar.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const PokeAppBar('Pokedex'),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(3, (index) {
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: const [
                  Flexible(
                    child: Image(
                        image: NetworkImage(
                            'https://www.pngmart.com/files/2/Pikachu-Transparent-Background.png')),
                    flex: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
                    child: Text('Pikachu',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: PokedexColors.primary,
        child: const Image(image: AssetImage('assets/pokeball_color.png')),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    ));
  }
}
