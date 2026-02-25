
import 'package:flutter/material.dart';

import '../../providers/theme_color_provider.dart';
import 'package:provider/provider.dart';
import '../../theme/theme.dart';
import 'widget/theme_color_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    ThemeColorProvider colorProvider = context.watch<ThemeColorProvider>();
    return Container(
      color: colorProvider.themeColor.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text(
            "Settings",
            style: AppTextStyles.heading.copyWith(
              color: colorProvider.themeColor.color,
            ),
          ),

          SizedBox(height: 50),

          Text(
            "Theme",
            style: AppTextStyles.label.copyWith(color: AppColors.textLight),
          ),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ThemeColor.values
                .map(
                  (theme) => ThemeColorButton(
                    themeColor: theme,
                    isSelected: theme == colorProvider.themeColor,
                    onTap: (value) { colorProvider.setTheme(value); },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
 