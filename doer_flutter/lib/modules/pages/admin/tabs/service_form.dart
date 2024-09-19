import 'dart:typed_data';

import 'package:doer_client/doer_client.dart';
import 'package:doer_flutter/constants/colors.dart';
import 'package:doer_flutter/main.dart';
import 'package:doer_flutter/modules/widgets/common_button.dart';
import 'package:doer_flutter/modules/widgets/common_textfield.dart';
import 'package:doer_flutter/providers/provider.dart';
import 'package:doer_flutter/utils/helpers/common_helpers.dart';
import 'package:doer_flutter/utils/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ServiceForm extends ConsumerStatefulWidget {
  const ServiceForm({
    super.key,
    required this.addNewService,
  });

  final Function(bool value) addNewService;

  @override
  ServiceStateForm createState() => ServiceStateForm();
}

class ServiceStateForm extends ConsumerState<ServiceForm> {
  TextEditingController serviceNameController = TextEditingController();

  List<TextEditingController> subServiceNameControllers = [];

  List<TextEditingController> serviceDescriptionControllers = [
    TextEditingController()
  ];

  List<List<TextEditingController>> subServiceDescriptionControllers = [
    [TextEditingController()]
  ];

  List<Stream<List<int>>?> fileStreams = [];
  List<String> imagePaths = [];
  List<XFile> images = [];

  String? url;
  Service? newService;
  List<Service> services = [];

  List<String> imageUrls = [];

  List<Uint8List> selectedImageList = [];

  List<SubService> subServiceList = [];
  List<ServiceClass> serviceClassList = [
    ServiceClass(
        nameController: TextEditingController(),
        descriptionController: [TextEditingController()])
  ];
  onButtonPressed({
    required String type,
    Service? service,
  }) async {
    if (type == 'CHOOSE_IMAGE') {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        images.add(image);
        final img = await image.readAsBytes();
        selectedImageList.add(img);
        for (var img in images) {
          setState(() {
            fileStreams.add(img.openRead());
            imagePaths.add(img.name + DateTime.now().toString());
          });
        }
      }
    } else if (type == 'SAVE') {
      for (var stream in fileStreams) {
        var uploadDescription = await client.upload
            .getUploadDescription(imagePaths[fileStreams.indexOf(stream)]);
        if (uploadDescription != null) {
          var uploader = FileUploader(uploadDescription);
          await uploader.upload(stream!, 1);
          var success = await client.upload
              .verifyUpload(imagePaths[fileStreams.indexOf(stream)]);
          if (success) {
            final imageUrl = await client.upload
                .getUploadPath(imagePaths[fileStreams.indexOf(stream)]);
            setState(() {
              imageUrls.add(imageUrl);
            });
          }
        }
      }

      final service = Service(
          name: serviceNameController.text,
          description: [
            for (var controller in serviceDescriptionControllers)
              controller.text
          ],
          subServices: [
            for (var subController in subServiceNameControllers)
              SubService(
                  name: subController.text,
                  image: imageUrls[
                      subServiceNameControllers.indexOf(subController) + 1],
                  description: [
                    for (var descController in subServiceDescriptionControllers[
                        subServiceNameControllers.indexOf(subController)])
                      descController.text
                  ])
          ],
          image: imageUrls[0]);
      // ref.read(serviceNotifierProvider.notifier).postServices(service: service);
    } else if (type == "DELETE") {
      await ref
          .read(serviceNotifierProvider.notifier)
          .deleteServices(service: service!);
      ref.read(serviceNotifierProvider.notifier).getServices();
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<ResponseState>(serviceNotifierProvider,
        (ResponseState? previous, ResponseState next) async {
      if (next.isLoading!) {
        showProgress(context);
      } else if (next.isError!) {
        context.pop(context);
        showMessage(context, next.errorMessage!);
      } else {
        context.pop();
        setState(() {
          showMessage(context, 'Succesfully added');
          widget.addNewService(false);
          ref.read(serviceNotifierProvider.notifier).getServices();
          context.pop();
        });
      }
    });

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "New service",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              CommonButton(
                label: 'Save',
                onButtonPressed: () {
                  onButtonPressed(type: "SAVE");
                },
              )
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 30),
            child: Column(
              children: [
                Column(
                  children: [
                    Card(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(children: [
                              Column(
                                children: [
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
                                                  icon: const Icon(
                                                    Icons.add,
                                                    color: WebAppColors.primary,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      serviceDescriptionControllers
                                                          .add(
                                                              TextEditingController());
                                                    });
                                                  },
                                                )
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
                                                    icon: const Icon(
                                                      Icons.remove,
                                                      color: WebAppColors.red,
                                                    )),
                                            ],
                                          ),
                                        )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CommonButton(
                                        label: 'Add sub service',
                                        onButtonPressed: () {
                                          setState(() {
                                            setState(() {
                                              subServiceNameControllers
                                                  .add(TextEditingController());
                                              subServiceDescriptionControllers
                                                  .add([
                                                TextEditingController()
                                              ]);
                                            });
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ]),
                          ),
                          Expanded(
                            flex: 1,
                            child: selectedImageList.isNotEmpty
                                ? Container(
                                    margin: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      children: [
                                        Image.memory(selectedImageList[0]),
                                        const Gap(10),
                                        CommonButton(
                                            onButtonPressed: () {
                                              setState(() {
                                                selectedImageList.remove(
                                                    selectedImageList[0]);
                                              });
                                              onButtonPressed(
                                                  type: 'CHOOSE_IMAGE');
                                            },
                                            label: 'Choose other image')
                                      ],
                                    ))
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CommonButton(
                                        label: 'Cover image',
                                        onButtonPressed: () {
                                          onButtonPressed(type: 'CHOOSE_IMAGE');
                                        },
                                      ),
                                    ],
                                  ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                Column(
                  children: [
                    for (var controller in subServiceNameControllers)
                      Card(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CommonTextField(
                                      labelText: 'Sub service Name',
                                      textEditingController: controller),
                                ),
                                Column(
                                  children: [
                                    for (var subController
                                        in subServiceDescriptionControllers[
                                            subServiceNameControllers
                                                .indexOf(controller)])
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: CommonTextField(
                                                labelText:
                                                    'Sub service description ${subServiceDescriptionControllers[subServiceNameControllers.indexOf(controller)].indexOf(subController) + 1}',
                                                textEditingController:
                                                    subController,
                                              ),
                                            ),
                                            if (subServiceDescriptionControllers[
                                                        subServiceNameControllers
                                                            .indexOf(
                                                                controller)]
                                                    .indexOf(subController) ==
                                                0)
                                              IconButton(
                                                  splashRadius: 1,
                                                  onPressed: () {
                                                    setState(() {
                                                      subServiceDescriptionControllers[
                                                              subServiceNameControllers
                                                                  .indexOf(
                                                                      controller)]
                                                          .add(
                                                              TextEditingController());
                                                    });
                                                  },
                                                  icon: const Icon(
                                                    Icons.add,
                                                    color: WebAppColors.primary,
                                                  ))
                                            else
                                              IconButton(
                                                  splashRadius: 1,
                                                  onPressed: () {
                                                    setState(() {
                                                      subServiceDescriptionControllers[
                                                              subServiceNameControllers
                                                                  .indexOf(
                                                                      controller)]
                                                          .removeAt(subServiceDescriptionControllers[
                                                                  subServiceNameControllers
                                                                      .indexOf(
                                                                          controller)]
                                                              .indexOf(
                                                                  subController));
                                                    });
                                                  },
                                                  icon: const Icon(
                                                    Icons.remove,
                                                    color: WebAppColors.red,
                                                  )),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ]),
                            ),
                            Expanded(
                              child: selectedImageList.length >
                                      subServiceNameControllers
                                              .indexOf(controller) +
                                          1
                                  ? Container(
                                      margin: const EdgeInsets.only(left: 20),
                                      child: Column(
                                        children: [
                                          Image.memory(selectedImageList[
                                              subServiceNameControllers
                                                      .indexOf(controller) +
                                                  1]),
                                          const Gap(10),
                                          CommonButton(
                                              onButtonPressed: () {
                                                setState(() {
                                                  selectedImageList.remove(
                                                      selectedImageList[0]);
                                                });
                                                onButtonPressed(
                                                    type: 'CHOOSE_IMAGE');
                                              },
                                              label: 'Choose other image')
                                        ],
                                      ))
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CommonButton(
                                          label: 'Cover image',
                                          onButtonPressed: () {
                                            onButtonPressed(
                                                type: 'CHOOSE_IMAGE');
                                          },
                                        ),
                                      ],
                                    ),
                            ),
                          ],
                        ),
                      ),
                  ],
                )
              ],
            ),
          )),
        ),
      ],
    );
  }
}

class ServiceClass {
  final TextEditingController nameController;
  final List<TextEditingController> descriptionController;
  ServiceClass(
      {required this.nameController, required this.descriptionController});
}
