import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:petpalui/view/pages/homePage.dart';
import 'package:petpalui/view/pages/loginPage.dart';
import 'package:petpalui/view/pages/searchPage.dart';
import 'package:petpalui/view/pages/profilePage.dart';
//import 'package:petpalui/view/pages/favoritesPage.dart';
import 'package:petpalui/view/components/navBar.dart';
import 'package:petpalui/view/pages/signUpPage.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'core/models/loggedUser.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                LoggedUser(email: "", password: "", isLoggedIn: false)),
      ],
      child: MaterialApp(
        title: 'Pet Pal',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Main(),
        routes: {
          '/home': (context) => Main(),
          '/search': (context) => SearchPage(),
          //'/favorites': (context) => FavoritesPage(),
          '/profile': (context) => ProfilePage(),
          '/signUp': (context) => SignUpPage()
        },
      ),
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = Provider.of<LoggedUser>(context).isLoggedIn;
    List<Widget> _widgetOptions = <Widget>[
      HomePage(),
      SearchPage(),
      //FavoritesPage(),
      isLoggedIn ? ProfilePage() : LoginPage(),
    ];
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: MyNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
