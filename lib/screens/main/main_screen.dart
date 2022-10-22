import 'package:flutter/material.dart';
import 'package:my_responsive_panel/controllers/menu_controller.dart';
import 'package:my_responsive_panel/responsive.dart';
import 'package:provider/provider.dart';

import './components/size_menu.dart';
import '../dashboard/dashboard_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: const SizeMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                child: SizeMenu(),
              ),
            const Expanded(
              flex: 5,
              child: Dashboardscreen(),
            ),
          ],
        ),
      ),
    );
  }
}
