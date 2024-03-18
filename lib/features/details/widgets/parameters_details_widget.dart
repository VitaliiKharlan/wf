import 'package:flutter/material.dart';

class ParametersDetailsWidget extends StatelessWidget {
  const ParametersDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/uv_index_bottom_widget_details_screen.png',
                height: 164,
                width: 164,
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/sunrise_bottom_widget_details_screen.png',
                height: 164,
                width: 164,
                fit: BoxFit.cover ,
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/wind_bottom_widget_details_screen.png',
                height: 164,
                width: 164,
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/rainfall_bottom_widget_details_screen.png',
                height: 164,
                width: 164,
                fit: BoxFit.cover ,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/feels_like_bottom_widget_details_screen.png',
                height: 164,
                width: 164,
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/humidity_bottom_widget_details_screen.png',
                height: 164,
                width: 164,
                fit: BoxFit.cover ,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/visibility_bottom_widget_details_screen.png',
                height: 164,
                width: 164,
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/pressure_bottom_widget_details_screen.png',
                height: 164,
                width: 164,
                fit: BoxFit.cover ,
              ),
            ],
          ),
        ),
      ],
    );
  }
}


