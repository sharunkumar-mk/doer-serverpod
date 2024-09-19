import 'package:doer_flutter/constants/colors.dart';
import 'package:flutter/material.dart';

class CommonTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String labelText;
  final String hintText;
  final bool hasSuffix;
  final bool hasPrefix;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final bool isPhone;
  final bool isEmail;
  final bool isPassword;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int? maxLines;

  const CommonTextField(
      {super.key,
      required this.textEditingController,
      this.labelText = 'Label Text',
      this.hintText = 'Hint Text',
      this.hasSuffix = false,
      this.hasPrefix = false,
      this.prefixIcon,
      this.suffixIcon,
      this.isPhone = false,
      this.isEmail = false,
      this.isPassword = false,
      this.validator,
      this.maxLines,
      this.onChanged});

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return TextFormField(
      maxLines: widget.maxLines,
      onChanged: widget.onChanged,
      validator: widget.validator,
      obscureText: showPassword
          ? false
          : widget.isPassword
              ? true
              : false,
      keyboardType: widget.isPhone
          ? TextInputType.phone
          : widget.isEmail
              ? TextInputType.emailAddress
              : null,
      controller: widget.textEditingController,
      style: TextStyle(
        // height: 2.5,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: isDarkMode ? WebAppColors.white : Colors.black,
      ),
      decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: isDarkMode ? WebAppColors.white : WebAppColors.black,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          hintMaxLines: 1,
          hintStyle: TextStyle(
              color: isDarkMode
                  ? WebAppColors.white.withOpacity(0.5)
                  : WebAppColors.black.withOpacity(0.5)),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: const BorderSide(
              width: 1,
              color: WebAppColors.primary,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: const BorderSide(
              width: 1,
              color: WebAppColors.red,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(
              width: 1,
              color: isDarkMode
                  ? WebAppColors.white
                  : WebAppColors.grey.withOpacity(0.2),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: const BorderSide(
              color: WebAppColors.primary,
              width: 1,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          prefixIcon: widget.hasPrefix ? widget.prefixIcon : null,
          suffixIcon: widget.isPhone
              ? Image.asset(
                  'assets/icons/call.png',
                  height: 24,
                  width: 24,
                )
              : widget.isPassword
                  ? IconButton(
                      splashRadius: 2,
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      icon: Image.asset(
                        showPassword
                            ? 'assets/icons/hide.png'
                            : 'assets/icons/view.png',
                        color: WebAppColors.grey.withOpacity(.5),
                        height: 24,
                        width: 24,
                      ))
                  : widget.hasSuffix
                      ? IconButton(
                          icon: widget.suffixIcon!,
                          onPressed: () {},
                        )
                      : null),
    );
  }
}
