
import 'package:flutter/material.dart';
import 'package:todoapp/Data%20model.dart';
import 'package:todoapp/book%20Seats.dart';

import 'package:provider/provider.dart';

class SeatsPage extends StatelessWidget {
  final RouteModel route;

  SeatsPage({required this.route});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Available Seats for ${route.name}')),
      body: Consumer<DataModel>(
        builder: (context, dataModel, child) {
          return ListView.builder(
            itemCount: route.seats.length,
            itemBuilder: (context, index) {
              var seat = route.seats[index];
              return ListTile(
                title: Text(seat),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BookSeatPage(route: route, seat: seat)),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}


