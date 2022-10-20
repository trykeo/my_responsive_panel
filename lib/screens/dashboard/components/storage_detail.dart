import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_responsive_panel/screens/dashboard/components/chart.dart';

import '../../../constants.dart';
import 'storage_info_card.dart';

class StorageDetail extends StatelessWidget {
  const StorageDetail({
    super.key,
    required this.paiChatSectionDatas,
  });

  final List<PieChartSectionData> paiChatSectionDatas;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Stoage Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Chart(paiChatSectionDatas: paiChatSectionDatas),
          const StorageInfoCard(
            svgPicture: 'assets/icons/Documents.svg',
            title: 'Document',
            subTitle: 1392,
            stoTitle: '13GB',
          ),
          const StorageInfoCard(
            svgPicture: 'assets/icons/media.svg',
            title: 'Media',
            subTitle: 1392,
            stoTitle: '13GB',
          ),
          const StorageInfoCard(
            svgPicture: 'assets/icons/folder.svg',
            title: 'Folder',
            subTitle: 1392,
            stoTitle: '13GB',
          ),
          const StorageInfoCard(
            svgPicture: 'assets/icons/unknown.svg',
            title: 'Unknown',
            subTitle: 1392,
            stoTitle: '13GB',
          ),
        ],
      ),
    );
  }
}
