import 'package:cached_network_image/cached_network_image.dart';
import 'package:doer_client/doer_client.dart';
import 'package:doer_flutter/constants/colors.dart';
import 'package:doer_flutter/modules/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ServiceItem extends StatelessWidget {
  final Service service;
  final VoidCallback? onButtonPressed;

  final String name;
  const ServiceItem(
      {super.key,
      required this.service,
      this.name = 'Contact',
      this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    // bool isMobile = ResponsiveLayout.isMobile(context);
    // bool isTablet = ResponsiveLayout.isTablet(context);
    // bool isDesktop = ResponsiveLayout.isDesktop(context);
    return Card(
      shape: const RoundedRectangleBorder(),
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: CachedNetworkImage(
                imageUrl: service.image,
                width: double.infinity,
                fit: BoxFit.cover,
              )),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        maxLines: 2,
                        service.name,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(10),
                      Text(
                        service.description.first,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CommonButton(
                        verticalPadding: 0,
                        horizontalPadding: 0,
                        childHpadding: 10,
                        childVpadding: 10,
                        onButtonPressed: onButtonPressed,
                        label: name,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
