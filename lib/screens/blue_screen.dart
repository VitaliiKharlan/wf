import 'package:flutter/material.dart';

class BlueScreenWidget extends StatelessWidget {
  final int counter;
  final String enterCityName;
  final Function changedCity;

  const BlueScreenWidget({
    super.key,
    required this.changedCity,
    required this.enterCityName,
    required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter Value: $counter'),
            ElevatedButton(
              onPressed: () => changedCity(),
              child: const Text('Kyiv'),
            ),
          ],
        ),
      ),
    );
  }
}
