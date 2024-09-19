import 'package:carousel_slider/carousel_slider.dart';
import 'package:doer_flutter/constants/colors.dart';
import 'package:doer_flutter/data/data.dart';
import 'package:doer_flutter/modules/widgets/common_button.dart';
import 'package:doer_flutter/modules/widgets/responsive_layout.dart';
import 'package:flutter/material.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  int featureSelected = 0;

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveLayout.isMobile(context);
    bool isDesktop = ResponsiveLayout.isDesktop(context);
    bool isTablet = ResponsiveLayout.isTablet(context);

    return Container(
      color: WebAppColors.lightGrey.withOpacity(.3),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                  height: isDesktop
                      ? 400
                      : isTablet
                          ? 350
                          : 600,
                  onPageChanged: (index, reason) {
                    setState(() {
                      featureSelected = index;
                    });
                  },
                  viewportFraction: 1,
                  disableCenter: true,
                  autoPlay: true,
                  autoPlayCurve: Curves.easeInOut),
              itemCount: featureList.length,
              itemBuilder: (context, index, realIndex) {
                return Flex(
                  crossAxisAlignment: isDesktop
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  verticalDirection: VerticalDirection.up,
                  direction: isMobile ? Axis.vertical : Axis.horizontal,
                  children: [
                    Flexible(
                      flex: isMobile ? 1 : 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.start,
                              featureList[index].heading,
                              style: const TextStyle(
                                  color: WebAppColors.black,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              textAlign: TextAlign.start,
                              featureList[index].subHeading,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: WebAppColors.black.withOpacity(.8),
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 20),
                            CommonButton(
                              horizontalPadding: 0,
                              hasBorder: true,
                              borderColor: WebAppColors.primary,
                              overlayColor: Colors.white,
                              label: 'Contact Us',
                              textColor: Colors.white,
                              childHpadding: 20,
                              fontSize: 12,
                              onButtonPressed: () {
                                // onButtonPressed(type: 'CONTACT');
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                        flex: 1,
                        child: Image.asset(
                            fit: BoxFit.contain,
                            'assets/images/${featureList[index].image}')),
                  ],
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var item in featureList)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: featureSelected == featureList.indexOf(item)
                              ? WebAppColors.primary
                              : WebAppColors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: WebAppColors.grey)),
                      height: 8,
                      width: 8,
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
