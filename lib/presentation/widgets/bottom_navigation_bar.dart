import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavigation extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavigation({required this.navigationShell, super.key});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: const Icon(Icons.punch_clock),
            label: AppLocalizations.of(context)!.stopwatch),
        BottomNavigationBarItem(
            icon: const Icon(Icons.location_on),
            label: AppLocalizations.of(context)!.location),
        BottomNavigationBarItem(
            icon: const Icon(Icons.radio_button_checked),
            label: AppLocalizations.of(context)!.buttons),
      ],
      currentIndex: navigationShell.currentIndex,
      onTap: (int tappedIndex) {
        navigationShell.goBranch(tappedIndex);
      },
    );
  }
}
