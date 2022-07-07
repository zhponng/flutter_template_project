/*
 * 文件: error_handler.dart
 * 描述: 公共的错误处理类
 * 当前修改时间: 2022年07月05日 11:35:50
 * 作者: Ponng stoneway.cn
 * http://blog.stoneway.cn Copyright (c) 2022
 */

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'dart:developer' as developer;

/// 全局统一的错误处理类
class ErrorHandler {

  static ErrorHandler? _instance;

  ErrorHandler._internal(){
    initConfig();
    _instance = this;
  }

  factory ErrorHandler() => _instance ??= ErrorHandler._internal();

  // 初始化配置方法
  void initConfig() {
    var _onError = FlutterError.onError;
    FlutterError.onError = (FlutterErrorDetails details) {
      _onError?.call(details);
      reportErrorAndLog(details);
    };
  }

  // 统一的处理错误的方法
  void reportErrorAndLog(FlutterErrorDetails details){
   //上报错误和日志逻辑
    developer.log(details.toString(), name: 'ErrorHandler 抓取错误');
  }

  // 搜集打印日志的方法
  void collectLog(String message){
    //搜集打印日志逻辑
    developer.log(message, name: 'ErrorHandler 抓取日志');
  }

  static ZoneSpecification get errorHandlerZoneSpecification {
    var _errorHandler = ErrorHandler();
    return ZoneSpecification(
      // 拦截print
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        _errorHandler.collectLog(line);
        parent.print(zone, "Interceptor: $line");
      },
      // 拦截未处理的异步错误
      handleUncaughtError: (Zone self, ZoneDelegate parent, Zone zone,
          Object error, StackTrace stackTrace) {
        _errorHandler.reportErrorAndLog(FlutterErrorDetails(exception: error, stack: stackTrace));
        parent.print(zone, '${error.toString()} $stackTrace');
      },
    );
  }

}