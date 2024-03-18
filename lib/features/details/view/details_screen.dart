import 'package:flutter/material.dart';
import '../widgets/air_quality_details_widget.dart';
import '../widgets/hourly_weekly_details.dart';
import '../widgets/main_details_widget.dart';
import '../widgets/parameters_details_widget.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E335A),

      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          SizedBox(height: 8),
          MainDetailsWidget(),
          SizedBox(height: 24),
          HourlyWeeklyDetailsWidget(),
          SizedBox(height: 8),
          AirQualityDetailsWidget(),
          SizedBox(height: 12),
          ParametersDetailsWidget(),
        ],
      ),
    );
  }
}

