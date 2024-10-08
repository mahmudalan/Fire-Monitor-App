import 'dart:math';

import 'package:dasboard_iot/pages/Profile.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    Color deepPurple = const Color(0xff86469C);
    Color Purple = const Color(0xffBC7FCD);
    Color pink = const Color(0xffFB9AD1);
    Color morePink = const Color(0xffFFCDEA);

    return Drawer(
      backgroundColor: morePink,
      width: 350,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                color: deepPurple,
                image: const DecorationImage(
                    image: AssetImage('lib/assets/background.png'),
                    fit: BoxFit.cover)),
            accountName: Text(
              'Sintia Tri Apriani',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text('sintiatriapriani@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'lib/assets/profile.jpg',
                ),
              ),
            ),
          ),
          ListTile(
            leading: Image.asset(
              'lib/assets/dashboard.png',
              height: 30,
              color: deepPurple,
            ),
            title: Text(
              'Dashboard',
              style: TextStyle(
                  fontFamily: 'Quenda', color: deepPurple, fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          ListTile(
            leading: Image.asset('lib/assets/profile.png',
                height: 30, color: deepPurple),
            title: Text(
              'Profile',
              style: TextStyle(
                  fontFamily: 'Quenda', color: deepPurple, fontSize: 20),
            ),
            onTap: () {},
          ),
          Divider(
            color: deepPurple,
            height: 10,
            endIndent: 20,
            indent: 10,
          ),
          ListTile(
            leading: Image.asset('lib/assets/setting.png',
                height: 30, color: deepPurple),
            title: Text(
              'Settings',
              style: TextStyle(
                  fontFamily: 'Quenda', color: deepPurple, fontSize: 20),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset('lib/assets/contact.png',
                height: 30, color: deepPurple),
            title: Text(
              'Contact Us',
              style: TextStyle(
                  fontFamily: 'Quenda', color: deepPurple, fontSize: 20),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset('lib/assets/question.png',
                height: 30, color: deepPurple),
            title: Text(
              'Help',
              style: TextStyle(
                  fontFamily: 'Quenda', color: deepPurple, fontSize: 20),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset('lib/assets/exit.png',
                height: 30, color: deepPurple),
            title: Text(
              'Sign Out',
              style: TextStyle(
                  fontFamily: 'Quenda', color: deepPurple, fontSize: 20),
            ),
            onTap: () {},
          ),
          Divider(
            color: deepPurple,
            height: 10,
            endIndent: 20,
            indent: 10,
          ),
          Center(
            child: Text(
              'Sintia Tri Apriani | 2024 | v1.0.0',
              style: TextStyle(
                  color: deepPurple,
                  fontFamily: 'Quenda',
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
