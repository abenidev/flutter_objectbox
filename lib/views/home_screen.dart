import 'package:demo/main.dart';
import 'package:demo/models/person.dart';
import 'package:demo/views/flexible_appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:objectbox/objectbox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Box personBox = objectbox.store.box<Person>();

  void addPerson() {
    final person = Person(firstName: 'Tina', lastName: 'David');
    int id = personBox.put(person);
    debugPrint(id.toString());
  }

  void getPerson() {
    final Person person = personBox.get(1);
    debugPrint(person.firstName.toString());
  }

  @override
  void initState() {
    // addPerson();
    // getPerson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(height: 60, decoration: const BoxDecoration(color: Colors.blue)),
      body: CustomScrollView(
        slivers: [
          //
          SliverAppBar(
            //
            title: Container(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'My Digital Currency',
                        style: TextStyle(color: Colors.white, fontFamily: 'Poppins', fontSize: 20.0),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(),
                        child: const Icon(
                          FontAwesomeIcons.bell,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Container(
                        decoration: const BoxDecoration(),
                        child: const Icon(
                          FontAwesomeIcons.gear,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //
            pinned: true,
            expandedHeight: 210.0,

            //
            flexibleSpace: const FlexibleSpaceBar(
              background: MyFlexiableAppBar(),
            ),
          ),
          // const SliverAppBar(
          //   expandedHeight: 160.0,
          //   pinned: true,
          //   // title: const Text('Hello, New data collector'),
          //   title: MyAppBar(),
          //   // titleSpacing: 20.0,
          //   // actions: <Widget>[
          //   //   IconButton(
          //   //     icon: const Icon(Icons.notifications),
          //   //     tooltip: 'Add new entry',
          //   //     onPressed: () {},
          //   //   ),
          //   //   IconButton(
          //   //     icon: const Icon(Icons.settings),
          //   //     tooltip: 'Add new entry',
          //   //     onPressed: () {},
          //   //   ),
          //   // ],
          //   // flexibleSpace: FlexibleSpaceBar(
          //   //   title: Container(
          //   //     decoration: const BoxDecoration(),
          //   //     child: const Center(
          //   //       child: Text('Available seats'),
          //   //     ),
          //   //   ),
          //   // ),
          //   // flexibleSpace: Container(
          //   //   decoration: const BoxDecoration(),
          //   //   child: Column(
          //   //     children: const [
          //   //       Text('Available seats'),
          //   //       Text('Available seats'),
          //   //       Text('Available seats'),
          //   //     ],
          //   //   ),
          //   // ),
          //   flexibleSpace: const MyFlexiableAppBar(),
          // ),

          //
          // SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: 140,
          //     child: Stack(
          //       children: [
          //         Container(
          //           height: 140,
          //           decoration: const BoxDecoration(
          //             color: Colors.blue,
          //             // borderRadius: BorderRadius.only(
          //             //   bottomLeft: Radius.circular(10),
          //             //   bottomRight: Radius.circular(10),
          //             // ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          //
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Container(
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  Positioned(
                    // top: 10,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 10, offset: const Offset(2, 6))],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 10, offset: const Offset(2, 6))],
                  ),
                );
              },
              childCount: 20,
            ),
          ),

          //
        ],
      ),
    );
  }
}
