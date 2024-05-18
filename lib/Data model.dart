import 'package:flutter/material.dart';
import 'dart:math';

class RouteModel {
  final String name;
  final String time;
  List<String> seats;

  RouteModel({required this.name, required this.time, required this.seats});
}

class Booking {
  final String routeName;
  final String seat;
  final String name;
  final int age;
  final String code;

  Booking({required this.routeName, required this.seat, required this.name, required this.age, required this.code});
}

class DataModel extends ChangeNotifier {
  List<RouteModel> routes = [
    RouteModel(name: 'Route 1: Tower To Malir', time: '10:00 AM', seats: ['Seat 1', 'Seat 2', 'Seat 3']),
    RouteModel(name: 'Route 3: Tower To Hadeed', time: '2:00 PM', seats: ['Seat 1', 'Seat 2']),
    RouteModel(name: 'Route 3: Baldia To Safoora ', time: '6:00 PM', seats: ['Seat 1', 'Seat 2', 'Seat 3', 'Seat 4']),
  ];

  List<Booking> bookings = [];

  void bookSeat(RouteModel route, String seat, String name, int age) {
    route.seats.remove(seat);
    String code = _generateBookingCode();
    bookings.add(Booking(routeName: route.name, seat: seat, name: name, age: age, code: code));
    notifyListeners();
  }

  String _generateBookingCode() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(6, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }
}

