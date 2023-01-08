import 'package:flutter/material.dart';
import 'package:theek_karo/models/category.dart';
import 'package:theek_karo/models/login_response_model.dart';
import 'package:theek_karo/models/tech.dart';
import 'package:theek_karo/components/tech_card.dart';
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
          ],
        ),
      ),
    );
  }
}
