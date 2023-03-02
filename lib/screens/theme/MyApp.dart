import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:our_community/nuemorphism/border_effect.dart';
import 'package:our_community/nuemorphism/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkModeEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  void _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkModeEnabled = prefs.getBool('isDarkModeEnabled') ?? false;
    });
  }

  void _toggleTheme(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkModeEnabled = newValue;
      prefs.setBool('isDarkModeEnabled', newValue);
    });
  }

  // late WhiteTheme white_theme;
  // late DarkTheme dark_theme;
  //  late Object theme;
  @override
  Widget build(BuildContext context) {
    if (isDarkModeEnabled) {
     DarkTheme theme = new DarkTheme();
      print(theme);
    } else {
     WhiteTheme theme = new WhiteTheme();
    }
    return MaterialApp(
      theme: isDarkModeEnabled
          ? ThemeData.dark().copyWith(
              scaffoldBackgroundColor: Color(0xFF121212),
            )
          : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Toggle button:',
                style: TextStyle(fontSize: 20.0),
              ),
              Switch(
                value: isDarkModeEnabled,
                onChanged: _toggleTheme,
                activeColor: Colors.green,
              ),
              SizedBox(height: 16.0),
              Text(
                'Container:',
                style: TextStyle(fontSize: 20.0),
              ),
              Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color:
                      isDarkModeEnabled ? Colors.grey[700] : Colors.grey[200],
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Icon:',
                style: TextStyle(fontSize: 20.0),
              ),
              Icon(
                Icons.favorite,
                size: 50.0,
                color: isDarkModeEnabled ? Colors.red : Colors.grey[700],
              ),
              SizedBox(height: 16.0),
              Text(
                'Text:',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                'Hello, world!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: isDarkModeEnabled ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Neumorphic button:',
                style: TextStyle(fontSize: 20.0),
              ),
              NeumorphicButton(
                // style: theme,
                child: Text(
                  'Press me!',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: isDarkModeEnabled ? Colors.white : Colors.black,
                  ),
                ),
                onPressed: () {
                  // Do something when the button is pressed
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
