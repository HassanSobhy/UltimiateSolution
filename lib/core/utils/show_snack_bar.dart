import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ultimate_solutions_task/config/theme/color_manager.dart';

void showSnackBar({
  required BuildContext context,
  required String message,
  required Color color,
  String? icon,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          if (icon != null && icon.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SvgPicture.asset(
                icon,
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  ColorManager.black,
                  BlendMode.srcIn,
                ),
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                message,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorManager.black,
                    ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: color,
    ),
  );
}
