import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
    required this.paiChatSectionDatas,
  });

  final List<PieChartSectionData> paiChatSectionDatas;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              startDegreeOffset: -90,
              sectionsSpace: 5,
              centerSpaceRadius: 70,
              sections: paiChatSectionDatas,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(height: defaultPadding),
                Text(
                  '29.1',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                  ),
                ),
                Text('of 128 GB'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
