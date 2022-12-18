import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:theek_karo/config.dart';
import 'package:theek_karo/models/tech.dart';

class TechCard extends StatelessWidget {
  final Tech? model;
  const TechCard({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        decoration: const BoxDecoration(color: Colors.white),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: model!.calculateDiscount > 0,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Text(
                        "${model!.calculateDiscount}% OFF",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: Image.network(
                    model!.fullImagePath,
                    fit: BoxFit.cover,
                  ),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 10),
                  child: Text(
                    model!.techName,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            Text(
                              "${Config.currency}${model!.techPrice.toString()}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 12,
                                color: model!.calculateDiscount > 0
                                    ? Colors.red
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                                decoration: model!.techSalePrice > 0
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                            Text(
                              (model!.calculateDiscount > 0)
                                  ? " ${model!.techSalePrice.toString()}"
                                  : "",
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.grey,
                          size: 20,
                        ),
                        onTap: () {},
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
