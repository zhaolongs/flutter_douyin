import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'main_find3_pages.dart';


void main() {
  runApp(MaterialApp(
    ///应用程序默认显示的页面
    home: MainFind3Page(),
    localizationsDelegates: [
      ///初始化默认的 Material 组件本地化
      GlobalMaterialLocalizations.delegate,
      ///初始化默认的 通用 Widget 组件本地化
      GlobalWidgetsLocalizations.delegate,
    ],

    ///当前区域，如果为null则使用系统区域一般用于语言切换
    ///传入两个参数，语言代码，国家代码
    ///这里配制为中国
    locale: Locale('zh', 'CN'),

    ///定义当前应用程序所支持的语言环境
    supportedLocales: [
      const Locale('en', 'US'), // English 英文
      const Locale('he', 'IL'), // Hebrew 西班牙
      const Locale('zh', 'CN'), // 中文，
    ],
  ));
}
