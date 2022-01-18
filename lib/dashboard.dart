import 'package:flutter/material.dart';
import 'package:ionathon/chartScreen.dart';
import 'package:ionathon/colorScheme.dart';
import 'package:ionathon/offsetProvider.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4Transform()
          .translate(x: context.watch<offsetProvider>().xoffsetHome, y: context.watch<offsetProvider>().yoffSetHome)
          .rotate(context.watch<offsetProvider>().angleHome)
          .matrix4,
      duration: Duration(milliseconds: 250),
      child: Scaffold(
        //backgroundColor: lightBlue,
        appBar: AppBar(
          backgroundColor: lightBlue,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ChangeNotifierProvider(
              create: (context)=>offsetProvider(),
              child: !context.watch<offsetProvider>().isOpen
                  ? IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  onPressed: () => context.read<offsetProvider>().closedDrawer()
              )
                  : IconButton(
                  icon: Icon(Icons.arrow_back_ios,
                      color: Color(0xFF1f186f)),
                  onPressed: ()=> context.read<offsetProvider>().openDrawer()
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: TextButton(
                 onPressed: () {  },
                child: Text('Change Class'),
              ),
            )
          ],
        ),
        body: ListView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            Container(
              color: lightBlue,
              child: Row(
                children: [
                  Container(
                    width: 200,
                    height: 260,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          left: 20,
                          child: Hero(
                            tag: "boy1Big",
                            child: Container(
                              height: 270,
                              width: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/boy1Big.png')
                                  )
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Mr. Peter Parker", style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'product'
                          ),),
                          SizedBox(height: 2,),
                          Text("someone@gmail.com", style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: darkBlue,
                              fontFamily: 'circe'
                          ),),
                          SizedBox(height: 15,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.phone_android,
                                color: darkBlue,
                                size: 18,),
                              SizedBox(width: 5,),
                              Text("+91-987654320", style: TextStyle(
                                  fontFamily: 'circe'
                              ),)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(Icons.class__rounded,
                              color: darkBlue,
                              size: 18,),
                              SizedBox(width: 5,),
                              Text("class 5", style: TextStyle(
                                  fontFamily: 'circe'
                              ),)
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 15),
              child: Text("Progress",textAlign: TextAlign.start, style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'product',
                  fontWeight: FontWeight.w600
              ),),
            ),
            Chart()
          ],
        ),
      ),
    );
  }
}
