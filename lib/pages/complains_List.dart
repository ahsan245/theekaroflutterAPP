import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theek_karo/components/complain_card.dart';
import 'package:theek_karo/controller/ComplainController.dart';
import 'package:theek_karo/pages/complain_detail_page.dart';

class Complains extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ComplainController>(
        init: ComplainController(),
        builder: (cc) => Scaffold(
            appBar: AppBar(
              title: Text('Complains'),
            ),
            body: ScrollConfiguration(
              behavior:
                  const MaterialScrollBehavior().copyWith(overscroll: false),
              child: cc.isLoad
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    )
                  : ListView(
                      padding: EdgeInsets.symmetric(
                          vertical: Get.height * 0.02,
                          horizontal: Get.height * 0.02),
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
                        Container(
                            height: Get.height,
                            child: ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: Get.height * 0.01,
                              ),
                              itemCount: cc.complainList.length,
                              itemBuilder: (context, index) => ComplainCard(
                                title: cc.complainList[index].name,
                                id: cc.complainList[index].id,
                                desc: cc.complainList[index].desc,
                                status:
                                    cc.complainList[index].status.toString(),
                                tap: () {
                                  Navigator.of(context).pushNamed(
                                    "/complain-details",
                                    arguments: {
                                      'complainId': cc.complainList[index].id,
                                      'assignedTech':
                                          cc.complainList[index].assignedTech
                                    },
                                  );
                                },
                              ),
                            )),
                      ],
                    ),
            )));
  }
}
