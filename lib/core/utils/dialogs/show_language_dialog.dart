import 'package:flutter/material.dart';
import 'package:ultimate_solutions_task/presentation/widgets/language_dialog_widget.dart';

Future showLanguageDialog({
  required BuildContext context,
  required String languageCode,
  required Function(String) onLanguageSelected,
}) async {
  return showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) => Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: LanguageDialogWidget(
          languageCode: languageCode,
          onLanguageSelected: onLanguageSelected,
        ),
      ),
    ),
  );
}
