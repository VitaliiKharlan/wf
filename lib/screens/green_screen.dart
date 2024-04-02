import 'package:flutter/material.dart';

class GreenScreenWidget extends StatelessWidget {
  final int counter;
  final String enterCityName;
  final Function changedCity;

  const GreenScreenWidget({
    super.key,
    required this.changedCity,
    required this.enterCityName,
    required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
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