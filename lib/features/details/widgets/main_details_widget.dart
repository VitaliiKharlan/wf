import 'package:flutter/material.dart';
import '../../theme/app_text_style.dart';

class MainDetailsWidget extends StatelessWidget {
  const MainDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Montreal',
            style: AppTextStyle.defaultRegularLargeTitle
                .copyWith(color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '19\u00B0',
                style: AppTextStyle.defaultSemiBoldTitle3
                    .copyWith(color: Colors.white),
              ),
              Text(
                ' | ',
                style: AppTextStyle.defaultSemiBoldTitle3
                    .copyWith(color: Colors.white),
              ),
              Text(
                ' Mostly ',
                style: AppTextStyle.defaultSemiBoldTitle3
                    .copyWith(color: Colors.white24),
              ),
              Text(
                ' Clear ',
                style: AppTextStyle.defaultSemiBoldTitle3
                    .copyWith(color: Colors.white24),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
