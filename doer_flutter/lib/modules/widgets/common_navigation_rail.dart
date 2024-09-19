import 'package:doer_flutter/constants/colors.dart';
import 'package:doer_flutter/modules/widgets/common_bottom_navigation.dart';
import 'package:flutter/material.dart';

class CommonNavigationRail extends StatefulWidget {
  final bool isExtended;
  final List<Widget> widgetOptions;
  final List<NavigationItem> navItems;
  final TabController tabController;

  const CommonNavigationRail({
    super.key,
    this.isExtended = false,
    required this.widgetOptions,
    required this.navItems,
    required this.tabController,
  });

  @override
  State<CommonNavigationRail> createState() => _CommonNavigationRailState();
}

class _CommonNavigationRailState extends State<CommonNavigationRail> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 200,
          child: Card(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: widget.navItems.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              titleTextStyle:
                                  const TextStyle(color: WebAppColors.primary),
                              selectedTileColor: WebAppColors.primary,
                              selectedColor: WebAppColors.white,
                              selected: selectedIndex == index,
                              contentPadding: const EdgeInsets.all(8),
                              onTap: () {
                                widget.tabController.animateTo(index);
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              leading: Image.asset(
                                  color: selectedIndex == index
                                      ? WebAppColors.white
                                      : WebAppColors.primary,
                                  width: 20,
                                  height: 20,
                                  widget.navItems[index].icon),
                              title: Text(widget.navItems[index].name),
                            ),
                            const Divider(
                              height: 0,
                            )
                          ],
                        );
                      }),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 10),
                          'Support & FAQs\nDOER 20S'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: widget.tabController,
            children: widget.widgetOptions,
          ),
        ),
      ],
    );
  }
}
