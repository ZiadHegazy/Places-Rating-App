import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Navbar extends StatefulWidget {
  int index;
  Navbar({required this.index});

  @override
  NavBarState createState() => NavBarState();
}
class NavBarState extends State<Navbar>{

  int selectedIndex = 0;


  @override
  void initState() {
    super.initState();
    selectedIndex = widget.index;

  }
  @override
  Widget build(BuildContext context) {


    return BottomNavigationBar(
      currentIndex: selectedIndex,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedItemColor: Color.fromRGBO(218, 3, 95, 1),
      unselectedItemColor: Colors.black,
      selectedLabelStyle: TextStyle(color: Color.fromRGBO(218, 3, 95, 1)),
      unselectedLabelStyle: TextStyle(color: Colors.black),
      onTap: (index) {
        if (index == 0) {
          setState(() {
            selectedIndex = 0;
          });
          Navigator.pushNamed(context, '/', arguments: 0);
        } else if (index == 1) {
          setState(() {
            selectedIndex = 1;
          });
          Navigator.pushNamed(context, '/home', arguments: 1);
        } else if (index == 2) {
          setState(() {
            selectedIndex = 2;
          });
          Navigator.pushNamed(context, '/favorite',arguments: 2);
        }else if (index == 3) {
          setState(() {
            selectedIndex = 3;
          });
          Navigator.pushNamed(context, '/profile',arguments: 3);
        }
      },


      items: [
        BottomNavigationBarItem(

          icon: Icon(Icons.home),
          label: 'Home',

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.place),
          label: 'Places',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );

  }
}