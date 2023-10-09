import 'package:flutter/material.dart';

import '../../../view/home/game/model/game_model.dart';
import '../card/game_card.dart';
class GameGrid extends StatelessWidget {
  const GameGrid({Key? key, this.models, this.onPressed}) : super(key: key);
  final List<GameModel>? models;
  final void Function(GameModel item, int indx)? onPressed;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.8,
      ),
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => GameCard(
        model: models![index],
        onPressed: () {
          onPressed!(models![index], index);
        },
      ),
    );
  }
}