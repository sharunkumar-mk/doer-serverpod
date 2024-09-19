import 'package:doer_flutter/constants/route_path.dart';
import 'package:doer_flutter/main.dart';
import 'package:doer_flutter/modules/widgets/common_button.dart';
import 'package:doer_flutter/modules/widgets/common_textfield.dart';
import 'package:doer_flutter/providers/provider.dart';
import 'package:doer_flutter/utils/helpers/common_helpers.dart';
import 'package:doer_flutter/utils/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

class AdminLoginPage extends ConsumerStatefulWidget {
  const AdminLoginPage({super.key});

  @override
  AdminLoginPageState createState() => AdminLoginPageState();
}

class AdminLoginPageState extends ConsumerState<AdminLoginPage> {
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  final authController = EmailAuthController(client.modules.auth);

  createAccount() async {
    final res = await authController.createAccountRequest(
        "username", "sharunkumar.mk@gmail.com", "Sharun@8086");
    // await authController.validateAccount(sharunkumar.mk@gmail.com, verificationCode);
    print(res);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<ResponseState>(loginNotifierProvider,
        (ResponseState? previous, ResponseState next) async {
      if (next.isLoading!) {
        showProgress(context);
      } else if (next.isError!) {
        context.pop();
        showMessage(context, next.errorMessage!);
      } else {
        context.pop();
        setState(() {
          showMessage(context, 'Signin sucessfully');
          context.goNamed(adminHomeScreen);
        });
      }
    });
    return Scaffold(
        body: Center(
            child: Card(
      shape: const RoundedRectangleBorder(),
      child: SizedBox(
        width: 300,
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  radius: 0,
                  onTap: () {
                    context.go('/');
                  },
                  child: const Text(
                    "Admin Login",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const Gap(10),
                CommonTextField(
                    maxLines: 1,
                    labelText: 'Email',
                    hintText: 'Enter email address',
                    isEmail: true,
                    textEditingController: emailEditingController),
                const Gap(20),
                CommonTextField(
                    maxLines: 1,
                    labelText: 'Password',
                    hintText: 'Enter password',
                    isPassword: true,
                    textEditingController: passwordEditingController),
                CommonButton(
                    childVpadding: 10,
                    label: 'Login',
                    onButtonPressed: () {
                      ref
                          .read(loginNotifierProvider.notifier)
                          .signInWithEmailAndPassword(
                              email: emailEditingController.text.trim(),
                              password: passwordEditingController.text.trim());
                    }),
              ],
            ),
          ),
        ),
      ),
    )));
  }
}
