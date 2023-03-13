import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ComplainCard extends StatelessWidget {
  ComplainCard({this.title, this.desc, this.id, this.status, this.tap});

  var title, desc, status, tap, id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(Get.height * 0.014)),
          padding: EdgeInsets.all(
            Get.height * 0.01,
          ),
          child: Row(
            children: [
              Container(
                height: Get.height * 0.065,
                width: Get.height * 0.065,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Get.height),
                    color: Colors.black.withOpacity(0.1)),
                child: Icon(Icons.laptop_mac),
              ),
              SizedBox(
                width: Get.width * 0.02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text(
                    '${desc.substring(0, desc.length > 30 ? 30 : desc.length)}${desc.length > 30 ? ' ...' : ''}'
                        .replaceAll("\n", " "),
                    style: TextStyle(fontSize: Get.height * 0.014),
                  ),
                ],
              ),
              Spacer(),
              Text(
                status == 'false' ? 'Inactive' : 'Active',
                style: TextStyle(
                    color: status == 'false' ? Colors.red : Colors.green),
              )
            ],
          )),
    );
  }
}
