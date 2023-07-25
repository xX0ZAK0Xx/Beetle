import 'package:beetle/pallete.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beetle"),
        leading: Icon(Icons.menu),
      ),
      body: Column(children: [
        Stack(
          children: [
            Center(
              child: Container(
                height: 120,
                width: 120,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Pallete.assistantCircleColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 4),
              height: 125,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage("assets/images/virtualAssistant.png")),
              ),
            )
          ],
        )
      ]),
    );
  }
}