import 'package:doer_client/doer_client.dart';
import 'package:doer_flutter/constants/colors.dart';
import 'package:doer_flutter/constants/route_path.dart';
import 'package:doer_flutter/data/data.dart';

import 'package:doer_flutter/modules/widgets/common_button.dart';
import 'package:doer_flutter/modules/widgets/common_drawer.dart';
import 'package:doer_flutter/modules/widgets/common_footer.dart';
import 'package:doer_flutter/modules/widgets/common_header.dart';
import 'package:doer_flutter/modules/widgets/common_service_item.dart';
import 'package:doer_flutter/modules/widgets/home_sections/hero_section.dart';
import 'package:doer_flutter/modules/widgets/responsive_layout.dart';
import 'package:doer_flutter/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  int hoverIndex = -1;
  bool serviceListHover = false;
  int serviceSelectedIndex = -1;
  int featureSelected = 0;
  bool animate = false;
  // late Map<Service, AnimationController> animationControllers;
  late AnimationController animationController;
  final topSection = GlobalKey();

  final ScrollController scrollController = ScrollController();

  bool isHover = false;

  onButtonPressed({required String type, service}) {
    if (type == 'CONTACT') {
      // context.go(contactScreen);
    } else if (type == 'SERVICES') {
      context.go(serviceScreen);
    } else if (type == 'SINGLE_SERVICE') {
      context.pushNamed(singleServiceScreen,
          pathParameters: {'serviceName': service!.name});
    }
  }

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(key.currentContext!,
        duration: const Duration(seconds: 1), curve: Curves.easeInOut);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(serviceNotifierProvider.notifier).getServices();
    });
    // animationController =
    //     AnimationController(vsync: this, duration: const Duration(seconds: 3));
    // animationControllers = {
    //   for (var services in serviceList)
    //     services: AnimationController(vsync: this),
    // };

    super.initState();
  }

  @override
  void dispose() {
    // for (var controller in animationControllers.values) {
    //   controller.dispose();
    // }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveLayout.isMobile(context);
    bool isTablet = ResponsiveLayout.isTablet(context);
    bool isDesktop = ResponsiveLayout.isDesktop(context);
    final state = ref.watch(serviceNotifierProvider);
    return Scaffold(
        backgroundColor: Colors.white,
        endDrawer: CommonDrawer(),
        appBar: const CommonHeader(),
        body: ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            primary: true,
            child: Column(
              key: topSection,
              children: [
                const HeroSection(),
                const Gap(100),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: isMobile
                          ? 10
                          : isTablet
                              ? 20
                              : 75),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.response.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile
                          ? 1
                          : isTablet
                              ? 2
                              : 4,
                      crossAxisSpacing: isMobile ? 10 : 20,
                      mainAxisSpacing: isMobile ? 10 : 20,
                      childAspectRatio: isDesktop
                          ? 0.65
                          : isTablet
                              ? 0.80
                              : 1,
                    ),
                    itemBuilder: (context, index) {
                      final item = state.response[index];
                      return ServiceItem(
                        name: 'View More',
                        service: item,
                        onButtonPressed: () {
                          onButtonPressed(
                              type: "SINGLE_SERVICE", service: item);
                        },
                      );
                    },
                  ),
                ),
                const Gap(100),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: isDesktop ? 75 : 10),
                  height: isMobile ? 800 : 500,
                  decoration:
                      const BoxDecoration(color: WebAppColors.lightBlack),
                  child: Flex(
                    verticalDirection: VerticalDirection.up,
                    direction: isMobile ? Axis.vertical : Axis.horizontal,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: isDesktop ? 50 : 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "SEO",
                                style: TextStyle(
                                    color: WebAppColors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                textAlign: TextAlign.start,
                                "Improve your online visibility with our expert search engine optimization services.",
                                style: TextStyle(
                                  color: WebAppColors.white,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 20),
                              CommonButton(
                                horizontalPadding: 0,
                                hasBorder: true,
                                borderColor: WebAppColors.primary,
                                overlayColor: Colors.white,
                                label: 'Optimize Now',
                                textColor: Colors.white,
                                childHpadding: 20,
                                fontSize: 12,
                                onButtonPressed: () {},
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          flex: isDesktop ? 2 : 1,
                          child: Image.asset(
                              fit: BoxFit.cover, "assets/images/seo.jpg"))
                    ],
                  ),
                ),
                const Gap(50),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: isDesktop ? 75 : 10),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'For Business',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: businessList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isMobile
                              ? 1
                              : isTablet
                                  ? 2
                                  : 4,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: isDesktop
                              ? 0.75
                              : isTablet
                                  ? .80
                                  : 1,
                        ),
                        itemBuilder: (context, index) {
                          final item = state.response[index];
                          return ServiceItem(
                            name: 'View More',
                            service: item,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const Gap(50),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CommonButton(
                        hasIcon: true,
                        backgroundColor: WebAppColors.lightGrey,
                        labelWithIcon: const Row(
                          children: [
                            Icon(
                              Icons.arrow_upward,
                              color: WebAppColors.black,
                            ),
                            Gap(10),
                            Text(
                              "Back to top",
                              style: TextStyle(
                                  color: WebAppColors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        verticalPadding: 0,
                        horizontalPadding: 0,
                        childHpadding: 0,
                        childVpadding: 5,
                        onButtonPressed: () {
                          scrollToSection(topSection);
                        },
                      ),
                    ],
                  ),
                ),
                const Gap(50),
                const CommonFooter(),
              ],
            ),
          ),
        ));
  }
}

class MyScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const CustomScrollPhysics();
  }
}

class CustomScrollPhysics extends ScrollPhysics {
  const CustomScrollPhysics({super.parent});

  @override
  CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    // Increase the scroll speed by multiplying the offset
    return super.applyPhysicsToUserOffset(position, offset * 100000);
  }
}
