import 'package:flutter/material.dart';

BottomNavigationBar BazarBottomNavigationBar(int currentindex,Function(int a) onTap){
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: currentindex,
    onTap: onTap,
    unselectedIconTheme:IconThemeData(size: 20),
    unselectedFontSize: 10,
    selectedFontSize: 12,
    items: [
      BottomNavigationBarItem(
          title: Text("Shop"),
          icon: Icon(Icons.shop)
      ),
      BottomNavigationBarItem(
          title: Text("For me"),

          icon: Icon(Icons.location_on)
      ),
      BottomNavigationBarItem(
          title: Text(""),
          icon: Icon(Icons.add_circle)
      ),
      BottomNavigationBarItem(
          title: Text("WishList"),
          icon: Icon(Icons.headset)
      ),
      BottomNavigationBarItem(
          title: Text("Cart"),
          icon: Icon(Icons.ac_unit_outlined)
      ),
    ],
  );
}