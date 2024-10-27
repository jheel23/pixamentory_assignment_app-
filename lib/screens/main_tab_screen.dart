import 'package:flutter/material.dart';
import 'package:games_hub/utils/fuctions.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class MainTabScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const MainTabScreen(this.navigationShell, {super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  int _currentIndex = 0;

  void _goToPage(int index) {
    setState(() {
      _currentIndex = index;
    });
    widget.navigationShell.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: widget.navigationShell,
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: theme.colorScheme.primary,
            elevation: 0,
            unselectedFontSize: 10,
            selectedFontSize: 12,
            type: BottomNavigationBarType.shifting,
            unselectedItemColor: Colors.black,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Iconsax.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.cloud),
                label: 'Web',
              ),
            ],
            currentIndex: _currentIndex,
            onTap: _goToPage));
  }
}
