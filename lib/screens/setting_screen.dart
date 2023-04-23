import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme_service.dart';
import 'package:flutter_application_1/widgets/image_container.dart';

import '../models/article_model.dart';
import '../widgets/custom_tag.dart';

class settingScreen extends StatelessWidget {
  const settingScreen({Key? key,}) : super(key: key);
  static const routeName = '/setting';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
         extendBodyBehindAppBar: true,
        body: SettingsS()
      ),
    );
  }
}

class SettingsS extends StatefulWidget {
  const SettingsS({super.key});

  @override
  State<SettingsS> createState() => _SettingsSState();
}

class _SettingsSState extends State<SettingsS> {
  @override
  Widget build(BuildContext context) {
    const moonIcon = CupertinoIcons.moon_stars;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Mode'),
           IconButton(
          onPressed: (){
            themeService().changeTheme();
          },
          icon: Icon(moonIcon,
          color: Colors.grey,
          )
          )
          ],
        ),
      ]
      )
    );
  }
}
