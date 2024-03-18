import 'package:flutter/material.dart';

class AirQualityDetailsWidget extends StatelessWidget {
  const AirQualityDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 168,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/air_quality_medium_widget_details_screen.png',
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
