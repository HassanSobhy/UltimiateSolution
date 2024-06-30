import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ultimate_solutions_task/config/theme/color_manager.dart';
import 'package:ultimate_solutions_task/core/resources/image_manager.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String? errorMessage;
  final Function(String) onChange;
  final TextInputType textInputType;

  const PasswordTextFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
    required this.onChange,
    this.errorMessage,
    this.textInputType = TextInputType.text,
  });

  @override
  State<PasswordTextFieldWidget> createState() =>
      _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  bool _showPassword = true;
  String _passwordIcon = ImageManager.showPassword;
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
      focusNode: _focus,
      keyboardType: widget.textInputType,
      controller: widget.controller,
      onChanged: widget.onChange,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w400,
            color: ColorManager.black,
            letterSpacing: -0.13,
          ),
      obscureText: _showPassword,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorManager.primary),
            borderRadius: BorderRadius.circular(22)),
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
        suffixIcon: IconButton(
          icon: SvgPicture.asset(_passwordIcon),
          onPressed: _toggleVisibilityIcon,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
        labelStyle: _labelStyle(context, _textFieldHasFocus),
        errorMaxLines: 2,
      ),
    );
  }

  void _toggleVisibilityIcon() {
    setState(() {
      _showPassword = !_showPassword;
      if (_showPassword) {
        _passwordIcon = ImageManager.showPassword;
      } else {
        _passwordIcon = ImageManager.hidePassword;
      }
    });
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

  @override
  void deactivate() {
    _focus.dispose();
    super.deactivate();
  }
}
