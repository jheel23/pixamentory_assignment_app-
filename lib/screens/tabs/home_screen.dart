import 'package:flutter/material.dart';
import 'package:games_hub/provider/dummy_data.dart';
import 'package:games_hub/utils/fuctions.dart';
import 'package:games_hub/widget/custom_app_bar.dart';
import 'package:games_hub/widget/custom_info_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CustomAppBar(
            theme: theme,
            title: 'Discover',
          ),
          SliverList.builder(
              itemCount: games.length,
              itemBuilder: (context, index) {
                return CustomInfoCard(
                  game: games[index],
                );
              }),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: kBottomNavigationBarHeight + 50,
            ),
          )
        ],
      ),
    );
  }
}
