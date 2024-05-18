import 'package:flutter/material.dart';
import 'package:todoapp/Data%20model.dart';
import 'package:todoapp/Routes.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DataModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'People\'s Bus Service',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: MainPage(),
        
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('People\'s Bus Service'),
      backgroundColor:Colors.blueGrey ,),
      
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RoutesPage()),
            );
            
            
          }, 
          
          child: Text('Available Routes')
          ,
         
          
        ),
        
      ),
      backgroundColor: Colors.redAccent,
      
    );
  }
}


