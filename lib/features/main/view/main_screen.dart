import 'dart:io';

import 'package:flutter/material.dart';
import 'package:weather_forecast/features/details/view/details_screen.dart';
import 'package:weather_forecast/features/main/view/nav_bar_model.dart';
import 'package:weather_forecast/features/main/view/nav_bar.dart';
import 'package:weather_forecast/features/theme/app.images.dart';
import 'package:weather_forecast/features/theme/app_text_style.dart';
import '../../../repositories/weather_details/models/city_coordinate.dart';
import '../../../repositories/weather_details/models/weather_forecast_details.dart';
import '../../../repositories/weather_details/weather_forecast_details_repository.dart';

import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:weather_forecast/screens/blue_screen.dart';
import 'package:weather_forecast/screens/green_screen.dart';
import 'package:weather_forecast/screens/pink_screen.dart';
import 'package:weather_forecast/screens/red_screen.dart';

import '../../../repositories/weather_details/weather_forecast_city_coordinate_repository.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final searchNavKey = GlobalKey<NavigatorState>();
  final notificationNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();
  int _selectedTab = 0;
  List<NavBarModel> items = [];

  List<CityCoordinate>? _cityCoordinates;
  WeatherForecastDetails? _weatherForecastDetails;

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  void initState() {
    _loadWeatherForecastCityCoordinate();
    _loadWeatherForecastDetails();
    super.initState();
    items = [
      NavBarModel(
        page: const TabPage(tab: 1),
        navKey: homeNavKey,
      ),
      NavBarModel(
        page: const TabPage(tab: 2),
        navKey: searchNavKey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      // !!! AppBar
      //
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   centerTitle: true,
      //   iconTheme: const IconThemeData(color: Colors.white),
      //   title: const Text('Weather Forecast'),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 40),
        height: 80,
        width: 80,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          elevation: 0,
          onPressed: () => debugPrint('Add Button pressed'),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 4,
              color: Color(0xFF5B5F78),
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Icon(
            Icons.add,
            color: Color(0xFF48319D),
          ),
        ),
      ),
      bottomNavigationBar: NavBar(
        pageIndex: _selectedTab,
        onTap: (index) {
          if (index == _selectedTab) {
            items[index]
                .navKey
                .currentState
                ?.popUntil((route) => route.isFirst);
          } else {
            setState(() {
              _selectedTab = index;
            });
          }
        },
      ),
      backgroundColor: Colors.lightBlueAccent,
      // (
      //     backgroundColor: Colors.lightBlueAccent,
      //     currentIndex: _selectedTab,
      //     items: const [
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.home,
      //         ),
      //         label: 'Main',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.tv_outlined,
      //         ),
      //         label: 'Details',
      //       ),
      //     ],
      //     onTap: onSelectTab),
      body: PageView(
        children: [
          (_cityCoordinates == null)
              ? const Center(child: CircularProgressIndicator())
              : Stack(
                  children: [
                    //
                    /// !!! PageView
                    //
                    // PageView(
                    //   children: [
                    //     BlueScreenWidget(),
                    //     GreenScreenWidget(),
                    //     PinkScreenWidget(),
                    //     RedScreenWidget(),
                    //   ],
                    // ),
                    const BackgroundWidget(),
                    const HouseWidget(),
                    DetailsInfoWidget(
                        cityCoordinate: _cityCoordinates!.first,
                        weatherForecastDetail: _weatherForecastDetails),
                  ],
                ),
          (_cityCoordinates == null)
              ? const Center(child: CircularProgressIndicator())
              : Stack(
                  children: [
                    //
                    /// !!! PageView
                    //
                    // PageView(
                    //   children: [
                    //     BlueScreenWidget(),
                    //     GreenScreenWidget(),
                    //     PinkScreenWidget(),
                    //     RedScreenWidget(),
                    //   ],
                    // ),
                    const BackgroundWidget(),
                    const HouseWidget(),
                    DetailsInfoWidget(
                        cityCoordinate: _cityCoordinates!.first,
                        weatherForecastDetail: _weatherForecastDetails),
                  ],
                ),
          const BlueScreenWidget(),
          const GreenScreenWidget(),
          const PinkScreenWidget(),
          const RedScreenWidget(),
        ],

        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     _cityCoordinate =
        //     await WeatherForecastRepository().getCityCoordinate();
        //     setState(() {});
        //   },
        //   child: const Icon(Icons.download),
        // ),
      ),
    );
  }

  Future<void> _loadWeatherForecastCityCoordinate() async {
    _cityCoordinates =
        await WeatherForecastCityCoordinateRepository().getCityCoordinate();
    setState(() {});
  }

  Future<void> _loadWeatherForecastDetails() async {
    _weatherForecastDetails =
        await WeatherForecastDetailsRepository().getWeatherForecastDetails();
    // print(_weatherForecastDetails);
    setState(() {});
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
  const DetailsInfoWidget({
    super.key,
    required this.cityCoordinate,
    required this.weatherForecastDetail,
  });

  final CityCoordinate cityCoordinate;
  final WeatherForecastDetails? weatherForecastDetail;

  @override
  Widget build(BuildContext context) {
    final modelWeatherDetail = weatherForecastDetail;
    final currentTemp = modelWeatherDetail?.main.temp;
    final currentTempRound = currentTemp?.toStringAsFixed(0).toString();

    final description =
        modelWeatherDetail?.weather.first.description.toString();
    final descriptionFirstUp = toBeginningOfSentenceCase('$description');

    final tempMax = modelWeatherDetail?.main.tempMax;
    final tempMaxRound = tempMax?.toStringAsFixed(0).toString();

    final tempMin = modelWeatherDetail?.main.tempMin;
    final tempMinRound = tempMin?.toStringAsFixed(0).toString();

    final modelCityCoordinate = cityCoordinate;
    final cityName = modelCityCoordinate.name.toString();
    final countryName = modelCityCoordinate.country.toString().toUpperCase();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 72),
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
            '$cityName, $countryName',
            style: AppTextStyle.defaultRegularLargeTitle
                .copyWith(color: Colors.white),
          ),
        ),
        Text(
          '$currentTempRound\u00B0',
          style:
              AppTextStyle.defaultThinLargeTitle.copyWith(color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '$descriptionFirstUp',
                style: AppTextStyle.defaultSemiBoldLargeTitle
                    .copyWith(color: Colors.white24),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 120),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'H: $tempMaxRound\u00B0',
                style: AppTextStyle.defaultSemiBoldLargeTitle
                    .copyWith(color: Colors.white),
              ),
              Text(
                'L: $tempMinRound\u00B0',
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

class _BottomNavigationBar extends StatefulWidget {
  final int onTap;

  const _BottomNavigationBar({
    required this.onTap,
  });

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  int _selectedTab = 0;
  int pageIndex = 0;

  // final Function(int) onTap;

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: Platform.isAndroid ? 16 : 0,
      ),
      child: BottomAppBar(
        elevation: 0.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 60,
            color: Colors.lightBlueAccent,
            child: Row(
              children: [
                navItem(
                  Icons.home_outlined,
                  pageIndex == 0,
                  // onTap: () => onTap(0),
                ),
                navItem(
                  Icons.notifications_outlined,
                  pageIndex == 1,
                  // onTap: () => onTap(0),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // BottomNavigationBar(
    //   backgroundColor: Colors.lightBlueAccent,
    //   currentIndex: _selectedTab,
    //   items: const [
    //     BottomNavigationBarItem(
    //       icon: Icon(
    //         Icons.home,
    //       ),
    //       label: 'Main',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(
    //         Icons.tv_outlined,
    //       ),
    //       label: 'Details',
    //     ),
    //   ],
    //   onTap: onSelectTab);
  }
}

Widget navItem(IconData icon, bool selected, {Function()? onTap}) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        color: selected ? Colors.white : Colors.white24,
      ),
    ),
  );
}

// class _BottomNavigationBar extends StatelessWidget {
//   const _BottomNavigationBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     int _selectedTab = 0;
//
//     void onSelectTab(int index) {
//       if (_selectedTab == index) return;
//       setState(() {
//         _selectedTab = index;
//       });
//     }
//
//     return BottomNavigationBar(
//         backgroundColor: Colors.lightBlueAccent,
//         currentIndex: _selectedTab,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//             ),
//             label: 'Main',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.tv_outlined,
//             ),
//             label: 'Details',
//           ),
//         ],
//         onTap: onSelectTab);
//   }
// }

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
