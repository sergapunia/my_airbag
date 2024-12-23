import 'package:airbag_project_new/go_router/go_router_navigation.dart';
import 'package:airbag_project_new/models/refill_model.dart';
import 'package:airbag_project_new/services/account_valancer.dart';
import 'package:airbag_project_new/services/shared/refills_shared_service.dart';
import 'package:airbag_project_new/services/tokens_service.dart';
import 'package:airbag_project_new/widgets/refill_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "AIRBAG",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: GoRouterNavigation.shellRoute.currentIndex,
        onTap: (i) {
          GoRouterNavigation.shellRoute.goBranch(i);
        },
        items: [
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(
              Icons.person_2_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: "Refills",
            icon: Icon(
              Icons.person_2_outlined,
            ),
          ),
        ],
      ),
      body: GoRouterNavigation.shellRoute,
    );
  }
}
