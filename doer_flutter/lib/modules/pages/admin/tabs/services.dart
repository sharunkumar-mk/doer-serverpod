import 'package:cached_network_image/cached_network_image.dart';
import 'package:doer_client/doer_client.dart';
import 'package:doer_flutter/constants/colors.dart';
import 'package:doer_flutter/main.dart';
import 'package:doer_flutter/modules/pages/admin/tabs/service_form.dart';
import 'package:doer_flutter/modules/widgets/common_button.dart';
import 'package:doer_flutter/modules/widgets/common_textfield.dart';
import 'package:doer_flutter/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class ServicesPage extends ConsumerStatefulWidget {
  const ServicesPage({super.key});

  @override
  ServicesPageState createState() => ServicesPageState();
}

class ServicesPageState extends ConsumerState<ServicesPage> {
  TextEditingController serviceNameController = TextEditingController();
  TextEditingController subServiceNameController = TextEditingController();

  List<TextEditingController> serviceDescriptionControllers = [
    TextEditingController()
  ];

  List<TextEditingController> subServiceDescriptionControllers = [
    TextEditingController()
  ];

  List<SubServiceClass> subServiceList = [
    SubServiceClass(
      nameController: TextEditingController(),
      descriptionControllers: [TextEditingController()],
    ),
  ];

  List<Stream<List<int>>?> fileStreams = [];
  List<String> imagePaths = [];
  List<XFile> images = [];
  String? url;
  Service? newService;
  List<Service> services = [];
  List<String> imageUrls = [];
  // List<SubService> subServiceList = [];
  bool showSubServices = false;
  bool addNewService = false;

  openDialogForm() {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(),
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Add new Service'),
                ],
              ),
              actions: [
                CommonButton(
                  backgroundColor: WebAppColors.red,
                  label: 'Cancel',
                  onButtonPressed: () {},
                ),
                CommonButton(
                    label: 'Save',
                    onButtonPressed: () {
                      onButtonPressed(type: "SAVE");
                    }),
              ],
              content: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            "Service",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Card(
                            shape: const RoundedRectangleBorder(),
                            child: Expanded(
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CommonTextField(
                                      labelText: 'Service name',
                                      textEditingController:
                                          serviceNameController),
                                ),
                                Column(
                                  children: [
                                    for (var controller
                                        in serviceDescriptionControllers)
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: CommonTextField(
                                                labelText:
                                                    'Service description ${serviceDescriptionControllers.indexOf(controller) + 1}',
                                                textEditingController:
                                                    controller,
                                              ),
                                            ),
                                            if (serviceDescriptionControllers
                                                    .indexOf(controller) ==
                                                0)
                                              IconButton(
                                                  splashRadius: 1,
                                                  onPressed: () {
                                                    setState(() {
                                                      serviceDescriptionControllers
                                                          .add(
                                                              TextEditingController());
                                                    });
                                                  },
                                                  icon: const Icon(Icons.add))
                                            else
                                              IconButton(
                                                  splashRadius: 1,
                                                  onPressed: () {
                                                    setState(() {
                                                      serviceDescriptionControllers
                                                          .removeAt(
                                                              serviceDescriptionControllers
                                                                  .indexOf(
                                                                      controller));
                                                    });
                                                  },
                                                  icon:
                                                      const Icon(Icons.remove)),
                                          ],
                                        ),
                                      )
                                  ],
                                ),
                                Row(
                                  children: [
                                    CommonButton(
                                      label: 'Cover image',
                                      onButtonPressed: () {
                                        onButtonPressed(type: 'CHOOSE_IMAGE');
                                      },
                                    ),
                                    CommonButton(
                                        backgroundColor: showSubServices
                                            ? WebAppColors.lightGrey
                                            : WebAppColors.primary,
                                        label: 'Add sub Services',
                                        onButtonPressed: !showSubServices
                                            ? () {
                                                setState(() {
                                                  // subServiceList.add(SubServiceClass(nameController:, descriptionControllers: descriptionControllers))
                                                  // subServiceList
                                                  //     .add(SubService());
                                                  showSubServices = true;
                                                });
                                              }
                                            : null),
                                  ],
                                ),
                              ]),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          if (showSubServices)
                            const Text(
                              "Sub services",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                        ],
                      ),
                      Column(
                        children: [
                          for (var subService in subServiceList)
                            Card(
                              shape: const RoundedRectangleBorder(),
                              child: Expanded(
                                child: Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CommonTextField(
                                        labelText: 'Sub service Name',
                                        textEditingController:
                                            subServiceNameController),
                                  ),
                                  Column(
                                    children: [
                                      for (var controller
                                          in subServiceDescriptionControllers)
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: CommonTextField(
                                                  labelText: 'Descirption',
                                                  textEditingController:
                                                      controller,
                                                ),
                                              ),
                                              if (subServiceDescriptionControllers
                                                      .indexOf(controller) ==
                                                  0)
                                                IconButton(
                                                    splashRadius: 1,
                                                    onPressed: () {
                                                      setState(() {
                                                        subServiceDescriptionControllers
                                                            .add(
                                                                TextEditingController());
                                                      });
                                                    },
                                                    icon: const Icon(Icons.add))
                                              else
                                                IconButton(
                                                    splashRadius: 1,
                                                    onPressed: () {
                                                      setState(() {
                                                        subServiceDescriptionControllers
                                                            .removeAt(
                                                                subServiceDescriptionControllers
                                                                    .indexOf(
                                                                        controller));
                                                      });
                                                    },
                                                    icon: const Icon(
                                                        Icons.remove)),
                                            ],
                                          ),
                                        )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CommonButton(
                                        label: 'Cover image',
                                        onButtonPressed: () {
                                          onButtonPressed(type: 'CHOOSE_IMAGE');
                                        },
                                      ),
                                      CommonButton(
                                        label: 'Add more sub services',
                                        onButtonPressed: () {
                                          setState(() {
                                            subServiceList.add(subService);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ]),
                              ),
                            )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  onButtonPressed({
    required String type,
    Service? service,
  }) async {
    if (type == 'CHOOSE_IMAGE') {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        images.add(image);

        for (var img in images) {
          setState(() {
            fileStreams.add(img.openRead());
            imagePaths.add(img.name + DateTime.now().toString());
          });
        }
      }
    } else if (type == "DELETE") {
      ref
          .read(serviceNotifierProvider.notifier)
          .deleteServices(service: service!);
      ref.read(serviceNotifierProvider.notifier).getServices();
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(serviceNotifierProvider.notifier).getServices();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(serviceNotifierProvider);
    return addNewService
        ? ServiceForm(
            addNewService: (value) {
              setState(() {
                addNewService = value;
              });
            },
          )
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CommonButton(
                    onButtonPressed: () {
                      setState(() {
                        addNewService = true;
                      });
                      // openDialogForm();
                    },
                    label: 'Add new Service',
                  )
                ],
              ),
              Expanded(
                child: state.isLoading!
                    ? const Center(child: CircularProgressIndicator())
                    : state.isError!
                        ? Center(
                            child: Text(state.errorMessage!),
                          )
                        : SingleChildScrollView(
                            child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.response.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4, crossAxisSpacing: 20),
                            itemBuilder: (context, index) {
                              final item = state.response[index];
                              return Card(
                                shape: const RoundedRectangleBorder(),
                                child: Column(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: CachedNetworkImage(
                                            imageUrl: item.image)),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20, bottom: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  maxLines: 2,
                                                  item.name,
                                                  style: const TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const Gap(10),
                                                Text(
                                                  item.description.first,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontSize: 15),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      onButtonPressed(
                                                          type: "DELETE",
                                                          service: item);
                                                    },
                                                    icon: const Icon(
                                                        Icons.delete))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )),
              )
            ],
          );
  }
}

class SubServiceClass {
  TextEditingController nameController;
  List<TextEditingController> descriptionControllers;

  SubServiceClass({
    required this.nameController,
    required this.descriptionControllers,
  });
}
