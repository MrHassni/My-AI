import 'package:eleven_ai/providers/theme_provider.dart';
import 'package:eleven_ai/screens/content/chat_manager.dart';
import 'package:eleven_ai/utils/color_constants.dart';
import 'package:eleven_ai/utils/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:eleven_ai/screens/content/home.dart';
import 'package:eleven_ai/screens/content/art.dart';
import 'package:eleven_ai/screens/content/profile.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../core/firebase/user/auth.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    Home(),
    ChatManager(),
    Art(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgPrimary(context),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBar(
          title:  Text(
           _selectedIndex == 0 ? "EXPLORE TOPICS" : _selectedIndex == 1 ? "CHATS" : _selectedIndex == 2 ? 'EXPLORE ART' : _selectedIndex == 3 ? 'PROFILE' : 'My AI',
            style:
            GoogleFonts.nunitoSans(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Provider.of<ThemeProvider>(context).isDark ? AppColors.primaryLight : AppColors.primaryDark,
            )
          ),
          actions: [
            IconButton(
              icon:  Icon(
                Icons.logout,
                color: Provider.of<ThemeProvider>(context).isDark ? AppColors.primaryLight : AppColors.primaryDark,
              ),
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      title: Text("Are you sure you want to log out?", style: head24(context, Colors.black),),
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text('Cancel', style: head24(context, AppColors.primary),)),
                        TextButton(onPressed: () async {
                          await Auth().signOut(context: context);
                        }, child: Text('LogOut', style: head24(context, AppColors.error),)),
                      ],
                    );
                  },
                );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const Settings(),
                //   ),
                // );
              },
            ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  bgPrimary(context),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: bgPrimary(context),
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              color: Provider.of<ThemeProvider>(context).isDark ? Colors.white.withOpacity(.15) : Colors.black.withOpacity(.15),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              textStyle: TextStyle(
                color: bgPrimary(context),
                fontWeight: FontWeight.bold
              ),
              rippleColor:
                  Theme.of(context).colorScheme.secondary.withOpacity(0.2),
              gap: 8,
              activeColor: bgPrimary(context),
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Theme.of(context).primaryColor,
              color: Theme.of(context).primaryColor,
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.commentDotsAlt,
                  text: 'Chat',
                ),
                GButton(
                  icon: LineIcons.palette,
                  text: 'Art',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
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
      ),
    );
  }
}
