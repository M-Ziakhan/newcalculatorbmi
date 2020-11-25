import 'package:bmi_calculator/Global%20Variables/globals.dart';
import 'package:bmi_calculator/Screens/about.dart';
import 'package:bmi_calculator/Screens/bmi_main.dart';
import 'package:bmi_calculator/Screens/settings.dart';
import 'package:bmi_calculator/Utilities/app_util.dart';
import 'package:bmi_calculator/Utilities/my_theme_keys.dart';
import 'package:bmi_calculator/Utilities/shared_preference_handler.dart';
import 'package:bmi_calculator/Utilities/theme_handler.dart';
import 'package:bmi_calculator/animations/size_transition.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:drawerbehavior/drawer_scaffold.dart';
import 'package:drawerbehavior/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:launch_review/launch_review.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
    CustomTheme.instanceOf(buildContext).changeTheme(key);
  }

  void getTheme() async {
    var key =
    await SharedPreference.getStringValue(SharedPreference.selectedTheme);
    switch (key) {
      case "MyThemeKeys.LIGHT":
        isDarkTheme = false;
        themeIcon = Icon(FontAwesomeIcons.solidMoon, color: Colors.black38);
        break;
      case "MyThemeKeys.DARKER":
        isDarkTheme = true;
        themeIcon = Icon(FontAwesomeIcons.solidSun);
        break;
      default:
        isDarkTheme = false;
        themeIcon = Icon(FontAwesomeIcons.solidMoon, color: Colors.black38);
        break;
    }
  }

  final menu = new Menu(
    items: [
      new MenuItem(id: 'home', title: 'Home'),
      new MenuItem(id: 'setting', title: 'Settings'),
      new MenuItem(id: 'aboutapp', title: 'About App'),
      new MenuItem(id: 'share', title: 'Share App'),
      new MenuItem(id: 'rateus', title: 'Rate App'),
      new MenuItem(id: 'feedback', title: 'Send Feedback')
    ],
  );

  var selectedMenuItemId = 'home';
  var _widget = Text("1");

  Widget headerView(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Image(
              image: AssetImage("Assets/Images/ic_launcher.png"),
              filterQuality: FilterQuality.high,
              width: 100.0,
              height: 100.0),
          Text("  BMI.",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }