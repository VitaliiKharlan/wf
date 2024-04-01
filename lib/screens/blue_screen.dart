import 'package:flutter/material.dart';

class BlueScreenWidget extends StatelessWidget {
  final String enterCityName;

  const BlueScreenWidget({
    super.key,
    required this.enterCityName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
