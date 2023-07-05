import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theek_karo/components/complain_card.dart';
import 'package:theek_karo/controller/ComplainController.dart';
import 'package:theek_karo/controller/techComplainController.dart';
import 'package:theek_karo/pages/complain_detail_page.dart';

import '../utils/appcolors.dart';
import 'dashboard_tech_page.dart';

class TechComplains extends StatelessWidget {
  const TechComplains({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TechComplainController>(
        init: TechComplainController(),
        builder: (cc) => Scaffold(
              appBar: AppBar(
                  backgroundColor: AppColors.deepOrange,
                  titleSpacing: 0,
                  elevation: 0,
                  title: Text(
                    "Complain List",
                    style: TextStyle(
                        color: AppColors.white, fontSize: Get.height * 0.024),
                  ),
                  leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        "/tech-home",
                        arguments: {'techID': techID},
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                  )),
              body: cc.isLoad
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(
                          vertical: Get.height * 0.02,
                          horizontal: Get.height * 0.02),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              "Complain Lists",
                              style: TextStyle(fontSize: Get.width * 0.06),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Expanded(
                              child: ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                              height: Get.height * 0.01,
                            ),
                            itemCount: cc.complainList.length,
                            itemBuilder: (context, index) => ComplainCard(
                              title: cc.complainList[index].name,
                              id: cc.complainList[index].id,
                              desc: cc.complainList[index].desc,
                              status: cc.complainList[index].status.toString(),
                              tap: () {
                                Navigator.of(context).pushNamed(
                                  "/tech-complain-details",
                                  arguments: {
                                    'complainId': cc.complainList[index].id,
                                    'assignedTech':
                                        cc.complainList[index].assignedTech,
                                    'user': cc.complainList[index].userid,
                                    // 'categoryassigned': cc
                                    //     .complainList[index].categoryassigned
                                  },
                                );
                              },
                            ),
                          )),
                        ],
                      ),
                    ),
            ));
  }
}
