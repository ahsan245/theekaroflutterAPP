import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ColExpand extends StatefulWidget {
  const ColExpand({this.title, this.content, Key? key}) : super(key: key);
  final String? title;
  final String? content;

  @override
  State<ColExpand> createState() => _ColExpandState();
}

class _ColExpandState extends State<ColExpand> {
  bool _showContent = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 3, bottom: 5, top: 2, right: 3),
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.grey, width: .5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              widget.title!,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                  _showContent ? Icons.arrow_drop_up : Icons.arrow_drop_down),
              onPressed: (() {
                setState(() {
                  _showContent = !_showContent;
                });
              }),
            ),
          ),
          _showContent
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Text(
                    widget.content!,
                    style: const TextStyle(fontSize: 13),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
