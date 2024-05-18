import 'package:flutter/material.dart';
import 'package:todoapp/Data%20model.dart';

import 'package:provider/provider.dart';

class BookSeatPage extends StatefulWidget {
  final RouteModel route;
  final String seat;

  BookSeatPage({required this.route, required this.seat});

  @override
  _BookSeatPageState createState() => _BookSeatPageState();
}

class _BookSeatPageState extends State<BookSeatPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  int age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Seat ${widget.seat} on ${widget.route.name}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  name = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid age';
                  }
                  return null;
                },
                onSaved: (value) {
                  age = int.parse(value!);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Provider.of<DataModel>(context, listen: false).bookSeat(widget.route, widget.seat, name, age);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Booking Confirmed'),
                          content: Text('Your seat has been booked. Your booking code is: ${Provider.of<DataModel>(context, listen: false).bookings.last.code}'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Book Seat'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


