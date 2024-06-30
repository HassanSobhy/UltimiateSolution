import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ultimate_solutions_task/config/theme/color_manager.dart';
import 'package:ultimate_solutions_task/core/resources/image_manager.dart';
import 'package:ultimate_solutions_task/generated/l10n.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 32,
          ),
          SvgPicture.asset(ImageManager.emptyOrder),
          const SizedBox(
            height: 48,
          ),
          Text(
            S.of(context).noOrdersYet,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 22,
                  color: ColorManager.black,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            S.of(context).youHaveNoOrdersYet,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ColorManager.black,
                  fontWeight: FontWeight.normal,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
