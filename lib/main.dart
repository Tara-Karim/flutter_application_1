import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/requests.dart';
import 'package:flutter_application_1/screens/home_page.dart';
import 'package:flutter_kurdish_localization/flutter_kurdish_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  if(prefs.containsKey(PREFS_DARK_MODE)){
    isDarkMode = prefs.getBool(PREFS_DARK_MODE)!;
  }else{
    prefs.setBool(PREFS_DARK_MODE, isDarkMode);
  }

  if(prefs.containsKey(PREFS_LANGUAGE)){
    language = prefs.getString(PREFS_LANGUAGE)!;
  }else{
    prefs.setString(PREFS_LANGUAGE, language);
  }

   runApp(MyStatefulApp());
}

class MyStatefulApp extends StatefulWidget {
  @override

  _MyStatefulAppState createState() => _MyStatefulAppState();

  static _MyStatefulAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyStatefulAppState>();
}

class _MyStatefulAppState extends State<MyStatefulApp> {
  ThemeMode _theme = isDarkMode? ThemeMode.dark: ThemeMode.light;
  Locale locale = Locale(language);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.blueGrey.shade300,
        appBarTheme: const AppBarTheme(),
        dividerColor: Colors.black12
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue,
        appBarTheme: const AppBarTheme(),
        dividerColor: Colors.white54
      ),
      themeMode: _theme,
      debugShowCheckedModeBanner: false,
      title: 'Flutter News App',
      localizationsDelegates: [
        AppLocalizations.delegate,
        KurdishCupertinoLocalizations.delegate,
        KurdishWidgetLocalizations.delegate,
        KurdishMaterialLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ku')
      ],
      locale: locale,
      home: HomePage()
    );
  }

  void changeTheme({required ThemeMode theme}) {
    setState(() {
      _theme = theme;
    });
  }

  void changeLocale({required String lang}){
    setState(() {
      locale = Locale(lang);
    });
  }
}
