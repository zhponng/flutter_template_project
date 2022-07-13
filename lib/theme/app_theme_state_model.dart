/*
 * 文件: app_theme_state_model.dart
 * 描述: 全局主题状态的model
 * 当前修改时间: 2022年07月13日 21:50:43
 * 作者: Ponng stoneway.cn
 * http://blog.stoneway.cn Copyright (c) 2022
 */

import 'package:flutter/material.dart';
import 'package:flutter_template_project/theme/app_theme.dart';

class AppThemeStateModel extends ChangeNotifier {

  // 当前状态
  AppThemeType _currentAppThemeType = AppThemeType.system;

  AppThemeType get currentAppThemeType => _currentAppThemeType;

  set currentAppThemeType(AppThemeType value) {
    _currentAppThemeType = value;
    notifyListeners();
  }
}