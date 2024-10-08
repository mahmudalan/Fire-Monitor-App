
import 'package:dasboard_iot/pages/navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'Fire_Page.dart';
import 'Profile.dart';
import 'Smoke_Page.dart';
import 'Temperature_Page.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color deepPurple = const Color(0xff86469C);
  Color Purple = const Color(0xffBC7FCD);
  Color pink = const Color(0xffFB9AD1);
  Color morePink = const Color(0xffFFCDEA);
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget> [
    Fire(),
    Smoke(),
    Temperature(),
    Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: morePink,
      drawer: NavBar(),
      appBar: AppBar(
        iconTheme:IconThemeData(color: morePink),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.search,color: morePink,)
          )
        ],
        backgroundColor: deepPurple,
        title: Center(
          child: Text('Acin Fire Monitor',style: TextStyle(
            color: morePink,
            fontWeight: FontWeight.bold,
            fontFamily: 'Diane',
            fontSize: 25
          ),),
        ),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child : _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        color: deepPurple,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
            tabActiveBorder: Border.all(color: Colors.white),
            backgroundColor: deepPurple,
            color: morePink,
            activeColor: Colors.white,
            tabBackgroundColor: Purple,
            padding: const EdgeInsets.all(13),
            gap: 10,
            iconSize: 30,
            tabs: const [
              GButton(
                icon: Icons.local_fire_department_rounded,
                text: 'Fire',
              ),
              GButton(
                icon: Icons.cloud,
                text: 'Smoke',
              ),
              GButton(
                icon: LineIcons.lowTemperature,
                text: 'Temperature',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Profile',
              )
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}

