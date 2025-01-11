import 'package:flutter/material.dart';
import 'package:mobile/src/core/constant/colors.dart';
import 'package:mobile/src/data/repositories/leadboard.dart';
import 'package:mobile/src/data/service/leaderboard.dart';
import 'package:mobile/src/domain/use_case/leaderboarddomain.dart';
import 'package:mobile/src/presentation/screens/home/home.dart';
import 'package:mobile/src/core/constant/text.dart';
import 'package:mobile/src/presentation/screens/main/alerts.dart';
import 'package:mobile/src/presentation/screens/main/leadboard.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  late String _appbartext;
  late Widget _page;

  @override
  void initState() {
    super.initState();
    _appbartext = texts.acceuil;
    _page = home();
  }
  void _popdrawer(){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        backgroundColor: Colorspick.primaryColor,
        centerTitle: true,
        title: Text(_appbartext, style: TextStyle(color: Colors.white)),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
                debugPrint("open drawer");
              },
              icon: Icon(Icons.menu, color: Colors.white, size: 30),
            );
          },
        ),
      ),
      body: _page,
      drawer: Drawer(
        backgroundColor: Colorspick.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Builder(builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).closeDrawer();

                  },
                  icon: Icon(Icons.close, color: Colors.white),
                );
              }),
            ),
            SizedBox(height: 30),
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 40,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.black)),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                texts.userName,
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                height: 2,
                indent: 10,
                endIndent: 10,
                color: Colors.white,
                thickness: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListTile(
                selectedColor: Colorspick.selectedcolro,
                title: Text(
                  texts.acceuil,
                  style: TextStyle(
                    fontSize: 14,
                    color: _appbartext == texts.acceuil
                        ? Colorspick.textlidcolor
                        : Colorspick.selectedtext,
                  ),
                ),
                leading: Icon(
                  Icons.home_max_outlined,
                  color: _appbartext == texts.acceuil
                      ? Colorspick.textlidcolor
                      : Colorspick.selectedtext,
                ),
                onTap: () {
                  setState(() {
                    _appbartext = texts.acceuil;
                    _page = home();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListTile(
                title: Text(
                  texts.leaderboard,
                  style: TextStyle(
                    fontSize: 14,
                    color: _appbartext == texts.leaderboard
                        ? Colorspick.textlidcolor
                        : Colorspick.selectedtext,
                  ),
                ),
                leading: Icon(
                  Icons.person_2_outlined,
                  color: _appbartext == texts.leaderboard
                      ? Colorspick.textlidcolor
                      : Colorspick.selectedtext,
                ),
                onTap: () {
                  setState(() {
                    _appbartext = texts.leaderboard;
                    _page = const LeaderboardScreen();
                  });
                  Scaffold.of(context).closeDrawer();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListTile(
                title: Text(
                  texts.mesAllerts,
                  style: TextStyle(
                    fontSize: 14,
                    color: _appbartext == texts.mesAllerts
                        ? Colorspick.textlidcolor
                        : Colorspick.selectedtext,
                  ),
                ),
                leading: Icon(
                  Icons.settings_accessibility_outlined,
                  color: _appbartext == texts.mesAllerts
                      ? Colorspick.textlidcolor
                      : Colorspick.selectedtext,
                ),
                onTap: () {
                  setState(() {
                    _appbartext = texts.mesAllerts;
                    _page = Alerts();

                  });

                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Divider(
                height: 2,
                indent: 10,
                endIndent: 10,
                color: Colors.white,
                thickness: 3,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.42),
            Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      texts.logout, // Use Texts class variable
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
