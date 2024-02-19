
import 'package:flutter/material.dart';

AppBar appbarWidget() {
    return AppBar(
      elevation: 0,leading:const Padding(
        padding:  EdgeInsets.all(8.0),
        child: Icon(Icons.menu)
      ),
        title: const Text(
          'Web App',
          style: TextStyle(
         
          ),
        ),
        actions: [

          IconButton(
            icon:const Icon(Icons.notifications),
            onPressed: () {
        
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
       
            },
          ),
        ],
      );
  }
  
