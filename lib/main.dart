* Method for change Statusbar color*/
void updateStatusBarColor() {
SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
systemNavigationBarColor: Colors.black,
statusBarColor: Colors.white,
));
}

void getAppVersionName() async {
try {
platformVersion = await GetVersion.projectVersion;
} on PlatformException {
platformVersion = 'Failed to get platform version.';
}
}

void getTheme() async {
var key =
await SharedPreference.getStringValue(SharedPreference.selectedTheme);
switch (key) {
case "MyThemeKeys.LIGHT":
isDarkTheme = false;
themeLabel = "Light Mode";
themeIcon = new Icon(FontAwesomeIcons.solidMoon, color: Colors.black38);
runApp(CustomTheme(initialThemeKey: MyThemeKeys.LIGHT, child: MyApp()));
break;
case "MyThemeKeys.DARKER":
isDarkTheme = true;
themeLabel = "Dark Mode";
themeIcon = new Icon(FontAwesomeIcons.solidSun);
runApp(CustomTheme(initialThemeKey: MyThemeKeys.DARKER, child: MyApp()));
break;
default:
isDarkTheme = false;
themeLabel = "Light Mode";
themeIcon = new Icon(FontAwesomeIcons.solidMoon, color: Colors.black38);
runApp(CustomTheme(initialThemeKey: MyThemeKeys.LIGHT, child: MyApp()));
break;
}
}

class MyApp extends StatelessWidget {
// This widget is the root of your application.
@override
Widget build(BuildContext context) {
SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

SystemChrome.setPreferredOrientations([
DeviceOrientation.portraitUp,
DeviceOrientation.portraitDown,
]);

return MaterialApp(
title: 'BMI',
debugShowCheckedModeBanner: false,
theme: CustomTheme.of(context),
home: Splash(),
);
}
}