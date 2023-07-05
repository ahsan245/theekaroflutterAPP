import 'package:flutter/material.dart';
import 'package:theek_karo/models/category.dart';
import 'package:theek_karo/models/login_response_model.dart';
import 'package:theek_karo/models/tech.dart';
import 'package:theek_karo/components/tech_card.dart';
import 'package:theek_karo/pages/dashboard_page.dart';
import 'package:theek_karo/widgets/widget_home_categories.dart';
import 'package:theek_karo/widgets/widget_home_slider.dart';
import 'package:theek_karo/widgets/widget_home_techs.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            const HomeSliderWidget(),
            const HomeCategoriesWidget(),
            const HomeTechsWidget(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 290, top: 10, right: 20, bottom: 20),
              child: Container(
                height: 50,
                child: FloatingActionButton(
                  backgroundColor: Colors.yellow.shade900,
                  child: Icon(
                    Icons.laptop_mac_rounded,
                    color: Colors.black,
                  ),
                  elevation: 20,
                  highlightElevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      "/complain",
                      arguments: {'userId': user},
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
