/*
 * 文件: app_theme.dart
 * 描述: 全局的主题配置类
 * 当前修改时间: 2022年07月06日 10:44:17
 * 作者: Ponng stoneway.cn
 * http://blog.stoneway.cn Copyright (c) 2022
 */

import 'package:flutter/material.dart';

const Color _primaryColor = Color(0xFFFFC107);

class AppThemes{
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    // 主要影响标题栏颜色，如果未设置[primarySwatch], 改颜色也会影响各组件的颜色
    primaryColor: _primaryColor,
    // 全局的主题颜色
    primarySwatch: createMaterialColor(_primaryColor),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    // 主要影响标题栏颜色，如果未设置[primarySwatch], 改颜色也会影响各组件的颜色
    primaryColor: _primaryColor,
    // 全局的主题颜色
    primarySwatch: createMaterialColor(_primaryColor),
  );
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}