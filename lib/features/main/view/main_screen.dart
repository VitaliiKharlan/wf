import 'package:flutter/material.dart';
import 'package:weather_forecast/features/details/view/details_screen.dart';
import 'package:weather_forecast/features/theme/app.images.dart';
import 'package:weather_forecast/features/theme/app_text_style.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTab = 0;

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Weather Forecast'),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.lightBlueAccent,
          currentIndex: _selectedTab,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Main',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.tv_outlined,
              ),
              label: 'Details',
            ),
          ],
          onTap: onSelectTab),
      body: const Stack(
        children: [
          BackgroundWidget(),
          HouseWidget(),
          DetailsInfoWidget(),
        ],
      ),
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      bottom: 0,
      child: Image.asset(AppImages.backgroundMainImage),
    );
  }
}

class HouseWidget extends StatelessWidget {
  const HouseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 54,
      bottom: 184,
      height: 280,
      child: Image.asset(AppImages.backgroundHouseImage),
    );
  }
}

class DetailsInfoWidget extends StatelessWidget {
  const DetailsInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DetailsScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          child: Text(
            'Montreal',
            style: AppTextStyle.defaultRegularLargeTitle
                .copyWith(color: Colors.white),
          ),
        ),
        Text(
          '19\u00B0',
          style:
              AppTextStyle.defaultThinLargeTitle.copyWith(color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 120),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Mostly',
                style: AppTextStyle.defaultSemiBoldLargeTitle
                    .copyWith(color: Colors.white24),
              ),
              Text(
                'Clear',
                style: AppTextStyle.defaultSemiBoldLargeTitle
                    .copyWith(color: Colors.white24),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 120),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                ' H:24\u00B0',
                style: AppTextStyle.defaultSemiBoldLargeTitle
                    .copyWith(color: Colors.white),
              ),
              Text(
                '   L:18\u00B0',
                style: AppTextStyle.defaultSemiBoldLargeTitle
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
