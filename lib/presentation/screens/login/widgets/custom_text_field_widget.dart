import 'package:flutter/material.dart';
import 'package:ultimate_solutions_task/config/theme/color_manager.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Function(String) onChange;
  final String labelText;
  final String? errorMessage;

  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.textInputType,
    required this.textInputAction,
    required this.onChange,
    required this.labelText,
    this.errorMessage,
  });

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {

  final FocusNode _focus = FocusNode();
  bool _textFieldHasFocus = false;

  @override
  void initState() {
    _focus.addListener(() {
      setState(() {
        _textFieldHasFocus = _focus.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      readOnly: false,
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChange,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w400,
            color: ColorManager.black,
            letterSpacing: -0.13,
          ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorManager.primary),
          borderRadius: BorderRadius.circular(22),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorManager.red),
          borderRadius: BorderRadius.circular(22),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorManager.primary),
            borderRadius: BorderRadius.circular(22)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorManager.red),
            borderRadius: BorderRadius.circular(22)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorManager.primary),
            borderRadius: BorderRadius.circular(22)),
        errorText: widget.errorMessage,
        labelText: widget.labelText,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
        labelStyle: _labelStyle(context, _textFieldHasFocus),
        errorMaxLines: 2,
      ),
    );
  }

  TextStyle _labelStyle(BuildContext context, bool hasFocus) {
    if (hasFocus || widget.controller.text.isNotEmpty) {
      return Theme.of(context).textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w400,
        color: widget.errorMessage == null
            ? ColorManager.grey
            : ColorManager.red,
        letterSpacing: -0.13,
      );
    } else {
      return Theme.of(context).textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w400,
        color: widget.errorMessage == null
            ? ColorManager.grey
            : ColorManager.red,
        letterSpacing: -0.13,
      );
    }
  }
}
