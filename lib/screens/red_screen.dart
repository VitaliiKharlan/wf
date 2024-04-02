import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast/features/details/view/details_screen.dart';
import 'package:weather_forecast/features/main/view/nav_bar.dart';
import 'package:weather_forecast/features/main/view/nav_bar_model.dart';
import 'package:weather_forecast/features/theme/app.images.dart';
import 'package:weather_forecast/features/theme/app_text_style.dart';
import 'package:weather_forecast/repositories/weather_details/models/city_coordinate.dart';
import 'package:weather_forecast/repositories/weather_details/models/weather_forecast_details.dart';
import 'package:weather_forecast/repositories/weather_details/weather_forecast_city_coordinate_repository.dart';
import 'package:weather_forecast/repositories/weather_details/weather_forecast_details_repository.dart';

class RedScreenWidget extends StatefulWidget {
  final int counter;
  final String enterCityName;
  final Function changedCity;

  const RedScreenWidget({
    super.key,
    required this.changedCity,
    required this.enterCityName,
    required this.counter,
  });

  @override
  State<RedScreenWidget> createState() => _RedScreenWidgetState();
}

class _RedScreenWidgetState extends State<RedScreenWidget> {
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
      backgroundColor: Colors.lightBlueAccent,
      body: (_cityCoordinates == null)
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                const BackgroundWidget(),
                const HouseWidget(),
                DetailsInfoWidget(
                  cityCoordinate: _cityCoordinates!.first,
                  weatherForecastDetail: _weatherForecastDetails,
                ),
              ],
            ),
    );
  }

  Future<void> _loadWeatherForecastCityCoordinate() async {
    _cityCoordinates = await WeatherForecastCityCoordinateRepository()
        .getCityCoordinate('Kyiv');
    setState(() {});
  }

  Future<void> _loadWeatherForecastDetails() async {
    _weatherForecastDetails = await WeatherForecastDetailsRepository()
        .getWeatherForecastDetails(lat, lon);

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
