import 'package:flutter/material.dart';
import 'package:todoapp/Data%20model.dart';
import 'package:todoapp/Seats.dart';

import 'package:provider/provider.dart';

class RoutesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dataModel = Provider.of<DataModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Available Routes')),
      body: ListView.builder(
        itemCount: dataModel.routes.length,
        itemBuilder: (context, index) {
          var route = dataModel.routes[index];
          return ListTile(
            title: Text(route.name),
            subtitle: Text('Available Seats: ${route.seats.length}, Time: ${route.time}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SeatsPage(route: route)),
              );
            },
          );
        },
      ),
    );
  }
}


