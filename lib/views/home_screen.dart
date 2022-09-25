
import 'package:demo/main.dart';
import 'package:demo/models/person.dart';
import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final Box personBox = objectbox.store.box<Person>();

  void addPerson(){
    final person = Person(firstName: 'Tina', lastName: 'David');
    int id = personBox.put(person);
    debugPrint(id.toString());
  }

  void getPerson(){
    final Person person = personBox.get(1);
    debugPrint(person.firstName.toString());
  }

  @override
  void initState() {
    // addPerson();
    getPerson();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}