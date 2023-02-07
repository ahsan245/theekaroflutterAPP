import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:theek_karo/models/complain_response_model.dart';
import 'package:theek_karo/pages/complain_detail_page.dart';
import 'package:theek_karo/pages/home_page.dart';
import 'package:theek_karo/pages/user_details_page.dart';

String user = "";
String complainId = "";
String assignedTech = "";

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<Widget> widgetList = const [
    ComplainDetailPage(),
    HomePage(),
    UserDetailsPage(),
  ];
  int index = 1;

  @override
  void didChangeDependencies() {
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map;

    if (arguments != null) {
      user = arguments["userId"];
      complainId = arguments["complainId"];
      print("merrrr");
      print(complainId);
      print("cc");
      print(user);
      print("Tech");
      print(assignedTech);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (_index) {
          // Navigator.of(context).pushNamed(
          //   "/complain",
          //   arguments: {'userId': user},
          // );

          setState(() {
            index = _index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.history_rounded), label: "Complains"),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_rounded), label: "Profile"),
        ],
      ),
      body: widgetList[index],
    );
  }
}
