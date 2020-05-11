import 'package:flutter/material.dart';


  Widget Draw(BuildContext context) {

    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(Icons.perm_identity),
                    radius: 40.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Welcome", style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),),
                        Text("User", style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white
                        ),)
                      ],),
                  ),
                  //Text("Hello")),
                  //Text("User"))


                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),

          ListTile(
            title: Text('Sign Out'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),

          ListTile(
            title: Text('Create Post'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
               Navigator.pop(context);
               //Navigator.of(context).pushNamedAndRemoveUntil('/Create Post', ModalRoute.withName('/CreatorDashboad'));
             Navigator.of(context).pushNamed('/Create Post');
            },
          ),
          ListTile(
            title: Text('News Dashboard'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
             // Navigator.pop(context);
              Navigator.of(context).pushNamedAndRemoveUntil('/ShowNewsDashboard', ModalRoute.withName('/ShowNewsDashboard'));

            },
          ),

          ListTile(
            title: Text('Admin'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
             // Navigator.of(context).pushNamed('/AdminDashboard');
              //Navigator.of(context).pushNamedAndRemoveUntil('/AdminDashboard', ModalRoute.withName('/ShowNewsDashboard'));
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/AdminDashboard');
            },
          ),
          ListTile(
            title: Text('Creator Dashboard'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/CreatorDashboad');

            },
          ),
        ],
      ),
    );

  }