import 'package:facex_load/routes/routes_path.dart';
import 'package:facex_load/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithBottomNavbar extends StatelessWidget {
  /// Constructs an [ScaffoldWithBottomNavbar].
  const ScaffoldWithBottomNavbar({
    required this.child,
    super.key,
  });

  /// The widget to display in the body of the Scaffold.
  /// In this sample, it is a Navigator.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Widget strip() {
      return Container(
        width: 8,
        height: 3,
        decoration: BoxDecoration(
          color: const Color(0xff82AAE3),
          borderRadius: BorderRadius.circular(10),
        ),
      );
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(SvgAssets.icHome.assetName),
            activeIcon: Column(
              children: [
                SvgPicture.asset(SvgAssets.icHome.assetName),
                strip(),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(SvgAssets.icDownload.assetName),
            activeIcon: Column(
              children: [
                SvgPicture.asset(SvgAssets.icDownload.assetName),
                strip(),
              ],
            ),
            label: '',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith(RoutesPath.home)) {
      return 0;
    }
    if (location.startsWith(RoutesPath.download)) {
      return 1;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(RoutesPath.home);
        break;
      case 1:
        GoRouter.of(context).go(RoutesPath.download);
        break;
    }
  }
}
