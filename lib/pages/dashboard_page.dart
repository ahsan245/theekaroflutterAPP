import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:theek_karo/models/complain_response_model.dart';
import 'package:theek_karo/pages/home_page.dart';

String user = "";

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<Widget> widgetList = const [
    HomePage(),
    HomePage(),
    HomePage(),
  ];
  int index = 0;
  String complainId = "";

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
          Navigator.of(context).pushNamed(
            "/complain",
            arguments: {'userId': user},
          );

          setState(() {
            index = _index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket), label: "store"),
          BottomNavigationBarItem(
              icon: Icon(Icons.create_outlined), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), label: "My Account"),
        ],
      ),
      body: widgetList[index],
    );
  }
}
