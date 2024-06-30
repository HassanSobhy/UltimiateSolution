import 'package:flutter/material.dart';
import 'package:ultimate_solutions_task/config/theme/color_manager.dart';
import 'package:ultimate_solutions_task/core/resources/image_manager.dart';
import 'package:ultimate_solutions_task/generated/l10n.dart';
import 'package:ultimate_solutions_task/presentation/widgets/custom_button_widget.dart';
import 'package:ultimate_solutions_task/presentation/widgets/language_choice_widget.dart';

class LanguageDialogWidget extends StatefulWidget {
  final String languageCode;
  final Function(String) onLanguageSelected;

  const LanguageDialogWidget({
    super.key,
    required this.languageCode,
    required this.onLanguageSelected,
  });

  @override
  State<LanguageDialogWidget> createState() => _LanguageDialogWidgetState();
}

class _LanguageDialogWidgetState extends State<LanguageDialogWidget> {
  String _tempLanguageCode = '';

  @override
  void initState() {
    super.initState();
    _tempLanguageCode = widget.languageCode;
  }
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).chooseLanguage,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LanguageChoiceWidget(
                  imagePath: ImageManager.arabicFlag,
                  title: S.of(context).araby,
                  subtitle: S.of(context).arabic,
                  isSelected: _isLanguageSelected('ar'),
                  onTap: (){
                    setState(() {
                      _tempLanguageCode = 'ar';
                    });
                  },
                ),
                const SizedBox(
                  width: 8,
                ),
                LanguageChoiceWidget(
                  imagePath: ImageManager.englishFlag,
                  title: S.of(context).english,
                  subtitle: S.of(context).english,
                  isSelected: _isLanguageSelected('en'),
                  onTap: (){
                    setState(() {
                      _tempLanguageCode = 'en';
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            CustomButtonWidget(
              onTap: () {
                widget.onLanguageSelected(_tempLanguageCode);
              },
              height: 48,
              buttonBorderRadius: 12,
              text: S.of(context).apply,
              backgroundColor: ColorManager.primary,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }

  bool _isLanguageSelected(String languageCode) {
    return _tempLanguageCode == languageCode;
  }
}
