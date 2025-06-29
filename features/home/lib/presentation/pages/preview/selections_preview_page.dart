import 'package:feature_home/presentation/pages/preview/selections_tabs/checkbox_selection_tab_page.dart';
import 'package:feature_home/presentation/pages/preview/selections_tabs/radio_selection_tab_page.dart';
import 'package:feature_home/presentation/pages/preview/selections_tabs/slider_selection_tab_page.dart';
import 'package:feature_home/presentation/pages/preview/selections_tabs/switch_selection_tab_page.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class SelectionsPreviewPage extends StatefulWidget {
  const SelectionsPreviewPage({super.key});

  @override
  State<SelectionsPreviewPage> createState() => _SelectionsPreviewPageState();
}

class _SelectionsPreviewPageState extends State<SelectionsPreviewPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      isSingleChildScrollView: false,
      appBar: AppBar(
        title: Text(context.l10n.selections),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Switches", icon: Icon(Icons.toggle_on)),
            Tab(text: "Checkboxes", icon: Icon(Icons.check_box)),
            Tab(text: "Radios", icon: Icon(Icons.radio_button_checked)),
            Tab(text: "Sliders", icon: Icon(Icons.slideshow)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SwitchSelectionTabPage(),
          CheckboxSelectionTabPage(),
          RadioSelectionTabPage(),
          SliderSelectionTabPage(),
        ],
      ),
      // body: Padding(
      //   padding: 24.edgeHorizontal,
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       24.paddingVertical,
      //       Text(
      //         context.l10n.selectionsPreviewDescription,
      //         style: Theme.of(context).textTheme.headlineSmall,
      //         textAlign: TextAlign.center,
      //       ),
      //       // Divider
      //       24.paddingVertical,
      //       Divider(),
      //       24.paddingVertical,
      //       Text(
      //         "Basic Switch - Android",
      //         style: Theme.of(context).textTheme.headlineSmall,
      //       ),
      //       24.paddingVertical,
      //       // basic switch Android
      //       BasicSwitch.android(
      //         initialValue: true,
      //         onChanged: (value) {},
      //         label: "Basic Switch Android Active",
      //       ),
      //       16.paddingVertical,
      //       // basic switch Android disabled
      //       BasicSwitch.android(
      //         initialValue: false,
      //         onChanged: (value) {},
      //         state: BasicSwitchState.disabled,
      //         label: "Basic Switch Android Inactive",
      //       ),
      //       16.paddingVertical,
      //       BasicSwitch.android(
      //         initialValue: true,
      //         onChanged: (value) {},
      //         activeIcon: const Icon(Icons.light_mode),
      //         inactiveIcon: const Icon(Icons.dark_mode),
      //         activeColor: Colors.yellow,
      //         inactiveColor: Colors.blue,
      //         activeBackgroundColor: Colors.yellow,
      //         inactiveBackgroundColor: Colors.black,
      //         label: "Basic Switch Android With Icons",
      //       ),
      //       16.paddingVertical,
      //       Divider(),
      //       24.paddingVertical,
      //       Text(
      //         "Basic Switch - iOS",
      //         style: Theme.of(context).textTheme.headlineSmall,
      //       ),
      //       24.paddingVertical,
      //       // basic switch iOS
      //       BasicSwitch.ios(
      //         initialValue: true,
      //         onChanged: (value) {},
      //         label: "Basic Switch iOS Active",
      //       ),
      //       16.paddingVertical,
      //       // basic switch iOS disabled
      //       BasicSwitch.ios(
      //         initialValue: false,
      //         onChanged: (value) {},
      //         state: BasicSwitchState.disabled,
      //         label: "Basic Switch iOS Inactive",
      //       ),
      //       16.paddingVertical,
      //       BasicSwitch.ios(
      //         initialValue: true,
      //         onChanged: (value) {},
      //         activeIcon: const Icon(Icons.light_mode),
      //         inactiveIcon: const Icon(Icons.dark_mode),
      //         activeColor: Colors.yellow,
      //         inactiveColor: Colors.blue,
      //         activeBackgroundColor: Colors.yellow,
      //         inactiveBackgroundColor: Colors.black,
      //         label: "Basic Switch IOS With Icons",
      //       ),
      //       16.paddingVertical,
      //       Divider(),
      //       24.paddingVertical,
      //       Text(
      //         "Basic Switch - Adaptive",
      //         style: Theme.of(context).textTheme.headlineSmall,
      //       ),
      //       24.paddingVertical,
      //       // basic switch Native
      //       BasicSwitch.adaptive(
      //         initialValue: true,
      //         onChanged: (value) {},
      //         label: "Basic Switch Adaptive Active",
      //       ),
      //       16.paddingVertical,
      //       // basic switch Adaptive disabled
      //       BasicSwitch.adaptive(
      //         initialValue: false,
      //         onChanged: (value) {},
      //         state: BasicSwitchState.disabled,
      //         label: "Basic Switch Adaptive Inactive",
      //       ),
      //       16.paddingVertical,
      //       BasicSwitch.adaptive(
      //         initialValue: true,
      //         onChanged: (value) {},
      //         activeIcon: const Icon(Icons.light_mode),
      //         inactiveIcon: const Icon(Icons.dark_mode),
      //         activeColor: Colors.yellow,
      //         inactiveColor: Colors.blue,
      //         activeBackgroundColor: Colors.yellow,
      //         inactiveBackgroundColor: Colors.black,
      //         label: "Basic Switch Adaptive With Icons",
      //       ),
      //       16.paddingVertical,
      //       Divider(),
      //       24.paddingVertical,
      //       Text(
      //         "Basic Switch - Icon",
      //         style: Theme.of(context).textTheme.headlineSmall,
      //       ),
      //       24.paddingVertical,
      //       // basic switch Icon
      //       BasicSwitch.icon(
      //         initialValue: true,
      //         onChanged: (value) {},
      //         activeIcon: const Icon(Icons.favorite),
      //         label: "Basic Switch Icon Active",
      //       ),
      //       16.paddingVertical,
      //       // basic switch Icon disabled
      //       BasicSwitch.icon(
      //         initialValue: true,
      //         onChanged: (value) {},
      //         state: BasicSwitchState.disabled,
      //         activeIcon: const Icon(Icons.favorite),
      //         label: "Basic Switch Icon Inactive",
      //       ),
      //       16.paddingVertical,
      //       // basic switch Icon custom colors
      //       BasicSwitch.icon(
      //         initialValue: true,
      //         onChanged: (value) {},
      //         activeIcon: const Icon(Icons.light_mode),
      //         inactiveIcon: const Icon(Icons.dark_mode),
      //         label: "Basic Switch Icon Custom Colors",
      //         activeColor: Colors.yellow,
      //         inactiveColor: Colors.blue,
      //         activeBackgroundColor: Colors.white,
      //         inactiveBackgroundColor: Colors.black,
      //         elevation: 10.0,
      //       ),
      //       24.paddingVertical,
      //       Divider(),
      //       24.paddingVertical,
      //       Text(
      //         "Basic Checkbox",
      //         style: Theme.of(context).textTheme.headlineSmall,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
