import 'package:flutter/cupertino.dart';
import 'app_colors.dart';

// TODO: ajustar styles
class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 24.0,
    letterSpacing: 0.25,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 28.0,
    letterSpacing: 0.25,
    fontWeight: FontWeight.w500,
    color: AppColors.text,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16.0,
    letterSpacing: 0.25,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );

  static const TextStyle inputText = TextStyle(
    fontSize: 18.0,
    letterSpacing: 0.25,
    fontWeight: FontWeight.w700,
    color: AppColors.text,
  );

  static const TextStyle errorText = TextStyle(
    fontSize: 22.0,
    letterSpacing: 0.25,
    fontWeight: FontWeight.w700,
    color: AppColors.textError,
  );

  static const TextStyle listTileTitle = TextStyle(
    fontSize: 16.0,
    letterSpacing: 0.25,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );

  static const TextStyle listTileSubtitle = TextStyle(
    fontSize: 16.0,
    letterSpacing: 0.25,
    fontWeight: FontWeight.w700,
    color: AppColors.text,
  );

  static const TextStyle listTileBody = TextStyle(
    fontSize: 14.0,
    letterSpacing: 0.25,
    fontWeight: FontWeight.w700,
    color: AppColors.text,
  );
}
