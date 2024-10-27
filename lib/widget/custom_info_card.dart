import 'package:flutter/material.dart';
import 'package:games_hub/model/game.dart';
import 'package:games_hub/utils/fuctions.dart';

class CustomInfoCard extends StatelessWidget {
  final Game game;
  const CustomInfoCard({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: deviceHeight * 0.4,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Image.network(
            game.imageUrl,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          height: deviceHeight * 0.4,
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.8),
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.all(20),
          child: Text(
            game.title,
            style: theme.textTheme.titleLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway'),
          ),
        ),
      ],
    );
  }
}
