import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_responsive_panel/constants.dart';
import 'package:my_responsive_panel/models/RecentFile.dart';
import 'package:my_responsive_panel/responsive.dart';

import 'components/Header.dart';
import 'components/my_file.dart';
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
            const Header(),
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
                      Container(
                        padding: const EdgeInsets.all(
                          defaultPadding,
                        ),
                        decoration: const BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Recent Files',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: DataTable(
                                horizontalMargin: 0,
                                columnSpacing: defaultPadding,
                                columns: const [
                                  DataColumn(label: Text("File Name")),
                                  DataColumn(label: Text("Date")),
                                  DataColumn(label: Text("Size")),
                                ],
                                rows: List.generate(
                                  demoRecentFiles.length,
                                  (index) => recentFileDataRow(
                                    demoRecentFiles[index],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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

  DataRow recentFileDataRow(RecentFile fileInfo) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              SvgPicture.asset(
                fileInfo.icon,
                height: 30,
                width: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                ),
                child: Text(
                  fileInfo.title,
                ),
              )
            ],
          ),
        ),
        DataCell(Text(fileInfo.date)),
        DataCell(Text(fileInfo.size)),
      ],
    );
  }
}
