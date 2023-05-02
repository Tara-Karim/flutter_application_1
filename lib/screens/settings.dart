import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Settings extends StatefulWidget{
  Settings();

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings>{

  bool isDarkModeEnabled = isDarkMode;
  String selectedLanguage = language;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SwitchListTile(
              title: Text(AppLocalizations.of(context)!.darkMode),
              value: isDarkModeEnabled,
              onChanged: (value) {
                setState(() {
                  isDarkModeEnabled = value;
                  });
                  isDarkMode = value;
                  MyStatefulApp.of(context)!.changeTheme(theme: value? ThemeMode.dark:ThemeMode.light);
              },
            ),
            SizedBox(height: 16.0),
            Text(AppLocalizations.of(context)!.language),
            DropdownButton<String>(
              value: selectedLanguage,
              items: languages.entries
                  .map((element) {
                return DropdownMenuItem<String>(
                  value: element.key,
                  child: Text(element.value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value!;
                });
                language = value!;
                  MyStatefulApp.of(context)!.changeLocale(lang: value!);
              },
            ),
          ],
        ),
      ),
    );
  }

}