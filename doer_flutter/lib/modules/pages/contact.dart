import 'package:doer_flutter/constants/colors.dart';
import 'package:doer_flutter/modules/widgets/common_button.dart';
import 'package:doer_flutter/modules/widgets/common_drawer.dart';
import 'package:doer_flutter/modules/widgets/common_footer.dart';
import 'package:doer_flutter/modules/widgets/common_header.dart';
import 'package:doer_flutter/modules/widgets/common_textfield.dart';
import 'package:doer_flutter/modules/widgets/responsive_layout.dart';
import 'package:doer_flutter/utils/helpers/common_helpers.dart';
import 'package:emailjs/emailjs.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveLayout.isMobile(context);
    bool isTablet = ResponsiveLayout.isTablet(context);

    return Scaffold(
        resizeToAvoidBottomInset: true,
        endDrawer: CommonDrawer(),
        appBar: const CommonHeader(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            isMobile || isTablet
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(children: [
                      const Text(
                        "Contact Us",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset("assets/images/contact.png"),
                      const ContactForm(),
                    ]),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      children: [
                        const Expanded(
                            child: Column(
                          children: [
                            Text(
                              "Contact Us",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ContactForm(),
                          ],
                        )),
                        const Gap(50),
                        Expanded(
                            child: Image.asset("assets/images/contact.png"))
                      ],
                    ),
                  ),
            const CommonFooter()
          ]),
        ));
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  late TextEditingController nameEditingController;
  late TextEditingController emailEditingController;
  late TextEditingController phoneEditingController;
  late TextEditingController messageEditingController;
  final formKey = GlobalKey<FormState>();
  bool showProgress = false;

  @override
  void initState() {
    nameEditingController = TextEditingController();
    emailEditingController = TextEditingController();
    phoneEditingController = TextEditingController();
    messageEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameEditingController.dispose();
    emailEditingController.dispose();
    phoneEditingController.dispose();
    messageEditingController.dispose();
    super.dispose();
  }

  void sendEmail() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        showProgress = true;
      });
      try {
        await EmailJS.send(
          'service_t3taj0z',
          'template_09njzdo',
          {
            "name": nameEditingController.text.trim(),
            "email": emailEditingController.text.trim(),
            "phone": phoneEditingController.text.trim(),
            "message": messageEditingController.text.trim(),
            "from_name": nameEditingController.text.trim(),
            "reply_to": emailEditingController.text.trim(),
          },
          const Options(
              // publicKey: 'cnlyX0ffSwvQ5SP4Y',
              // privateKey: 'yWLvOwggMHRIUFDCWLrAf',
              ),
        );
        setState(() {
          showProgress = false;
          showMessage(context, 'Your message has been sent.');
        });
      } catch (error) {
        if (error is EmailJSResponseStatus) {
          showLog('ERROR... ${error.status}: ${error.text}');
        }
        setState(() {
          showMessage(context, 'Failed to send message.');
          showProgress = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveLayout.isDesktop(context);
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isDesktop ? 50 : 05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CommonTextField(
                  validator: emptyValidator,
                  hintText: 'Name',
                  labelText: 'Your Name',
                  textEditingController: nameEditingController),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CommonTextField(
                  validator: emailValidator,
                  hintText: 'Email',
                  labelText: 'Your Email',
                  textEditingController: emailEditingController),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CommonTextField(
                  validator: phoneNumberValidator,
                  hintText: 'Phone Number',
                  labelText: 'Phone Number',
                  textEditingController: phoneEditingController),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CommonTextField(
                  maxLines: 5,
                  validator: emptyValidator,
                  labelText: 'Message',
                  hintText: 'Message',
                  textEditingController: messageEditingController),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CommonButton(
                    horizontalPadding: 10,
                    label: 'Send Message',
                    hasIcon: showProgress,
                    labelWithIcon: const SizedBox(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(
                        color: WebAppColors.black,
                      ),
                    ),
                    onButtonPressed: () {
                      sendEmail();
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
