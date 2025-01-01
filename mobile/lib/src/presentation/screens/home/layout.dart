import 'package:flutter/material.dart';
import 'package:mobile/src/presentation/screens/home/home.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {

  late String _appbartext ;
  late Widget _page ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appbartext),
        leading: IconButton(onPressed: (){Scaffold.of(context).openDrawer();}, icon: Icon(Icons.menu),),
      ),
      body: _page,
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          
          children: [
            IconButton(onPressed: (){Scaffold.of(context).closeDrawer();}, icon: Icon(Icons.menu),),
            SizedBox(height: 20,),
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 40,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: Colors.black
                  )
                ),
              ),
            ),
            SizedBox(height: 5,),//todo
            Align(alignment: Alignment.center,child: Text("User Name",style: TextStyle(fontSize: 20),),),//well amange how to fetch from the db 
            Divider( color: Colors.white,thickness: 3,),
            ListTile(
              title: Text("acceuil"),
              leading: Icon(Icons.home),
              onTap: ( ){
                setState(() {
                  _appbartext = "acceuil";
                  _page = home();
                });
              },
            ),
            ListTile(
              title: Text("leaderboard"),
              leading: Icon(Icons.person),
              onTap: (){
                setState(() {
                  _appbartext = "leaderboard";
                  _page = home();
                });
              },
            ),
            ListTile(
              title: Text("Mes allerts"),
              leading: Icon(Icons.settings),
              onTap: (){
                setState(() {
                  _appbartext = "Mes allerts";
                  _page = home();
                });
              },
            ),
           

          ],  

        ),
      ),
      
    );
  }
}
