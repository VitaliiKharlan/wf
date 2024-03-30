import 'package:flutter/material.dart';
import 'package:weather_forecast/features/theme/app.images.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const NavBar({
    super.key,
    required this.pageIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Positioned(
        //   left: 0,
        //   bottom: 0,
        //   child: Image.asset(AppImages.bottomNavigationBarTabBar),
        // ),
        Positioned(
          left: 0,
          bottom: 0,
          child: Image.asset(AppImages.bottomNavigationBarRectangle),
        ),
        Positioned(
          left: 64,
          bottom: 0,
          child: Image.asset(AppImages.bottomNavigationBarSubtract),
        ),
        // Container(
        //   margin: EdgeInsets.only(
        //     left: 8,
        //     right: 8,
        //     bottom: Platform.isAndroid ? 0 : 0,
        //   ),
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(10),
        //     child: Container(
        //       height: 80,
        //       color: Colors.red,
        //       child:
        SizedBox(
          height: 88,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              navItem(
                const AssetImage(
                    'assets/icons/bottom_navigation_bar_map_icon.png'),
                pageIndex == 0,
                onTap: () => onTap(0),
              ),
              navItem(
                const AssetImage(
                    'assets/icons/bottom_navigation_bar_list_icon.png'),
                pageIndex == 1,
                onTap: () => onTap(1),
              ),
            ],
          ),
        ),

        //     ),
        //   ),
        // ),
      ],
    );
  }
}

Widget navItem(AssetImage image, bool selected, {Function()? onTap}) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      child: Image(
        image: image,
        color: selected ? Colors.white : Colors.white24,
      ),
    ),
  );
}

class TabPage extends StatelessWidget {
  final int tab;

  const TabPage({
    super.key,
    required this.tab,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tab $tab')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Tab $tab'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Page(tab: tab),
                  ),
                );
              },
              child: const Text('Go to page'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  final int tab;

  const Page({
    super.key,
    required this.tab,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Tab $tab')),
      body: Center(child: Text('Tab $tab')),
    );
  }
}
