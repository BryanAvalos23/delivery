import 'package:delivery/components/description_box.dart';
import 'package:delivery/components/drawer.dart';
import 'package:delivery/components/my_tab_bar.dart';
import 'package:delivery/components/sliver_app_bar.dart';
import 'package:delivery/pages/current_location.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // tab controller
  late TabController _tabControles;

  @override
  void initState() {
    super.initState();
    _tabControles = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabControles.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                MySliverAppBar(
                  title: MyTabBar(tabController: _tabControles),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        indent: 25,
                        endIndent: 25,
                        color: Theme.of(context).colorScheme.secondary,
                      ),

                      // Current Location
                      const MyCurrentLocation(),

                      // Description box
                      const MyDescriptionBox()
                    ],
                  ),
                ),
              ],
          body: TabBarView(
            controller: _tabControles,
            children: [
              // first tab
              ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => const Text("first tab item"),
              ),

              // second tab
              ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => const Text("second tab item"),
              ),

              // third tab
              ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => const Text("third tab item"),
              ),
            ],
          )),
    );
  }
}
