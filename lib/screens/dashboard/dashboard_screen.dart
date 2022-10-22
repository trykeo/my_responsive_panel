import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../responsive.dart';
import 'components/header_widget.dart';
import 'components/my_file.dart';
import 'components/recent_file_widget.dart';
import 'components/storage_detail.dart';

class Dashboardscreen extends StatelessWidget {
  const Dashboardscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PieChartSectionData> paiChatSectionDatas = [
      PieChartSectionData(
        color: primaryColor,
        value: 15,
        showTitle: false,
        radius: 25,
      ),
      PieChartSectionData(
        color: const Color(0xFF26E5FF),
        value: 20,
        showTitle: false,
        radius: 22,
      ),
      PieChartSectionData(
        color: const Color(0xFFFFCF26),
        value: 15,
        showTitle: false,
        radius: 19,
      ),
      PieChartSectionData(
        color: const Color(0xFFEE2727),
        value: 15,
        showTitle: false,
        radius: 16,
      ),
      PieChartSectionData(
        color: primaryColor.withOpacity(0.1),
        value: 25,
        showTitle: false,
        radius: 13,
      ),
    ];
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const HeaderWidget(),
            const SizedBox(
              height: defaultPadding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const MyFile(),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      const BodyDashBoard(),
                      if (Responsive.isMobile(context))
                        const SizedBox(
                          height: defaultPadding,
                        ),
                      if (Responsive.isMobile(context))
                        StorageDetail(
                          paiChatSectionDatas: paiChatSectionDatas,
                        ),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  const SizedBox(
                    width: defaultPadding,
                  ),
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child:
                        StorageDetail(paiChatSectionDatas: paiChatSectionDatas),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
