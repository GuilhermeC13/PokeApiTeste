import 'package:flutter/material.dart';
import 'package:poke_api_teste/core/utils/text_utils.dart';

class StatRowWidget extends StatelessWidget {
  const StatRowWidget({
    Key? key,
    required this.statName,
    required this.statValue,
    required this.statPercent,
    required this.statColor,
  }) : super(key: key);

  final String statName;
  final String statValue;
  final double statPercent;
  final Color statColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            '$statName: $statValue',
            style: textStatsStyleDark,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 3,
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey,
            color: statColor,
            value: statPercent,
            minHeight: 8,
          ),
        )
      ],
    );
  }
}
