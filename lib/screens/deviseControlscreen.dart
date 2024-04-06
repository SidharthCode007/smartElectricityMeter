import 'package:flutter/material.dart';
import 'package:smartmeter/constants/size.dart';

class ControlDevice extends StatelessWidget {
  const ControlDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Buttonwidget(
            text: 'Light',
            icon: Icons.light,
          ),
          Buttonwidget(
            text: 'Fan',
            icon: Icons.light,
          ),
          Buttonwidget(
            text: 'Light',
            icon: Icons.light,
          ),
          Buttonwidget(
            text: 'Fan',
            icon: Icons.light,
          )
        ],
      ),
    );
  }
}

class Buttonwidget extends StatelessWidget {
  final String text;
  final IconData icon;
  const Buttonwidget({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
      child: Container(
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 234, 239, 194),
            border: Border.all(style: BorderStyle.none),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [w10, Icon(icon), Text(text)],
            ),
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text("ON")),
                w5,
                ElevatedButton(onPressed: () {}, child: Text("OFF"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
