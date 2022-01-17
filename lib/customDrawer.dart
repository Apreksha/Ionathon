import 'package:flutter/material.dart';
import 'package:ionathon/colorScheme.dart';
import 'package:ionathon/homePage.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SecondLayer(),
          ThirdLayer(),
          HomePage(),
        ],
      ),
    );
  }
}

class SecondLayer extends StatefulWidget {
  @override
  SecondLayerState createState() => SecondLayerState();

// openTab() => createState().openTab();
}

late SecondLayerState secondLayerState;
class SecondLayerState extends State<SecondLayer> {

  double xoffSet = 0;
  double yoffSet = 0;
  double angle = 0;

  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        transform: Matrix4Transform()
            .translate(x: xoffSet, y: yoffSet)
            .rotate(angle)
            .matrix4,
        duration: Duration(milliseconds: 550),
         decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10), color: darkBlue),
      child: Column(
          children: [
            Row(
              children: [],
            )
          ],
        ));
  }
}
class ThirdLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FlutterLogo(
                        size: MediaQuery.of(context).size.width / 4,
                      ),
                      Row(
                        children: [
                          Text(
                            "FLUTTER",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            " NAME",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.blue[200],
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Home Screen",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                Text(
                  "Screen 2",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                Divider(
                  color: yellow,
                  thickness: 2,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                Text(
                  "About",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                Text(
                  "Share App",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                Divider(
                  color: yellow,
                  thickness: 2,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                Text(
                  "Bye",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
