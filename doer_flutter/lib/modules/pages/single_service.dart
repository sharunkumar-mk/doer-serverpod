import 'package:cached_network_image/cached_network_image.dart';
import 'package:doer_client/doer_client.dart';
import 'package:doer_flutter/constants/colors.dart';
import 'package:doer_flutter/modules/widgets/common_button.dart';
import 'package:doer_flutter/modules/widgets/common_drawer.dart';
import 'package:doer_flutter/modules/widgets/common_header.dart';
import 'package:doer_flutter/modules/widgets/responsive_layout.dart';
import 'package:doer_flutter/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SingleServicePage extends ConsumerStatefulWidget {
  final String? serviceName;

  const SingleServicePage({
    super.key,
    this.serviceName,
  });

  @override
  _SingleServicePageState createState() => _SingleServicePageState();
}

class _SingleServicePageState extends ConsumerState<SingleServicePage> {
  Service? serviceDetails;
  @override
  void initState() {
    fetchServiceDetails(serviceName: widget.serviceName);
    super.initState();
  }

  fetchServiceDetails({String? serviceName}) async {
    // await ref.read(serviceNotifierProvider.notifier).getServices();

    final services = ref.read(serviceNotifierProvider.notifier).servicesList;
    print(services);
    for (var service in services!) {
      if (service.name == serviceName) {
        serviceDetails = service;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(serviceNotifierProvider);
    bool isMobile = ResponsiveLayout.isMobile(context);
    bool isTablet = ResponsiveLayout.isTablet(context);
    bool isDesktop = ResponsiveLayout.isDesktop(context);
    return Scaffold(
      endDrawer: CommonDrawer(),
      appBar: const CommonHeader(),
      body: serviceDetails == null
          ? const Center(child: Text('Service not found'))
          : state.isLoading!
              ? const Center(child: CircularProgressIndicator())
              : state.isError!
                  ? Center(
                      child: Text(state.errorMessage!),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          for (var service in serviceDetails!.subServices)
                            if (isDesktop)
                              if (serviceDetails!.subServices.indexOf(service) %
                                      2 ==
                                  0)
                                Card(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 75, vertical: 20),
                                  shape: const RoundedRectangleBorder(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(30.0),
                                              child: ServiceDescription(
                                                  service: service)),
                                        ),
                                        Flexible(
                                            child: CachedNetworkImage(
                                                imageUrl: service.image!))
                                      ],
                                    ),
                                  ),
                                )
                              else
                                Card(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 75, vertical: 20),
                                  shape: const RoundedRectangleBorder(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flexible(
                                            child: CachedNetworkImage(
                                                imageUrl: service.image!)),
                                        Flexible(
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(30.0),
                                              child: ServiceDescription(
                                                  service: service)),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                        ],
                      ),
                    ),
    );
  }
}

class ServiceDescription extends StatelessWidget {
  const ServiceDescription({
    super.key,
    required this.service,
  });

  final SubService service;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              service.name!,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var sub in service.description!)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.circle,
                      size: 8,
                    ),
                    const Gap(10),
                    Text(
                      sub,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
          ],
        )
      ],
    );
  }
}
