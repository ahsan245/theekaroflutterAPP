import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:theek_karo/config.dart';
import 'package:theek_karo/models/tech.dart';

class CardTech extends StatelessWidget {
  final Tech? model;
  const CardTech({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        decoration: const BoxDecoration(color: Colors.white),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        image: NetworkImage(model!.fullImagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: (() {
                    Navigator.of(context).pushNamed(
                      "/tech-details",
                      arguments: {'techId': model!.techId},
                    );
                  }),
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
              ],
            ),
          ],
        ));
  }
}
