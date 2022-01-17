import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionathon/colorScheme.dart';
import 'package:ionathon/customDrawer.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double xoffSet = 0;
  double yoffSet = 0;
  double angle = 0;

  bool isOpen = false;
  bool isPlaying = false;
  @override
  Widget build(BuildContext context){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark
    ));
    return AnimatedContainer(
      transform: Matrix4Transform()
          .translate(x: xoffSet, y: yoffSet)
          .rotate(angle)
          .matrix4,
      duration: Duration(milliseconds: 250),
      child: Scaffold(
        backgroundColor: lightBlue,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Stack(
            children: [
              !isOpen
                  ? IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Color(0xFF1f186f),
                  ),
                  onPressed: () {
                    setState(() {
                      xoffSet = 150;
                      yoffSet = 80;
                      angle = -0.2;
                      isOpen = true;
                    });

                    secondLayerState.setState(() {
                      secondLayerState.xoffSet = 122;
                      secondLayerState.yoffSet = 110;
                      secondLayerState.angle = -0.275;
                    });
                  })
                  : IconButton(
                  icon: Icon(Icons.arrow_back_ios,
                      color: Color(0xFF1f186f)),
                  onPressed: () {
                    if (isOpen == true) {
                      setState(() {
                        xoffSet = 0;
                        yoffSet = 0;
                        angle = 0;
                        isOpen = false;
                      });

                      secondLayerState.setState(() {
                        secondLayerState.xoffSet = 0;
                        secondLayerState.yoffSet = 0;
                        secondLayerState.angle = 0;
                      });
                    }
                  }),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Colors.black,
                size: 30,
              ), onPressed: () {  },
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/searchBg.png")
                  )
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello", style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'circe'
                    ),),
                    Text("John Scott", style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'circe',
                        fontWeight: FontWeight.w700
                    ),),
                    Expanded(
                        child: Container()
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white
                      ),
                      child: Row(
                        children: [
                          Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 30,
                            ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'circe'
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search for Courses "
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30,)
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(30),
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("All Subjects", style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),),
                        Text("See all", style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 13
                        ),)
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            tutorWidget("boy1Big", "Mr. Pater Parker", "English", "0-6", "150"),
                            tutorWidget("girl", "Ms. Leena Dey", "Arts & Crafts", "0-4", "100"),
                            tutorWidget("boy2", "Mr. Jason Shrute", "Math", "0-2", "100"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  InkWell tutorWidget(String img, String name, String subj, String grade, String price)
  {
    return InkWell(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.only(top: 20),
        height: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: lightBlue.withOpacity(0.5)
        ),
        child: Row(
          children: [
            Container(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
                    child: Container(
                      height: 125,
                      width: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('asset/images/iconBgNew.png'),
                              fit: BoxFit.contain
                          )
                      ),
                    ),
                  ),
                  Container(
                    height: 130,
                    padding: EdgeInsets.only(left: 5, top: 5),
                    child: Stack(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          child: RotatedBox(
                            quarterTurns: 2,
                            child: Icon(
                              Icons.star,
                              color: darkBlue,
                              size: 60,
                            ),
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          child: Center(
                            child: Text("4.5", style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Colors.white
                            ),),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    left: 50,
                    child: Hero(
                      tag: img,
                      child: Container(
                        width: 100,
                        height: 130,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('asset/images/$img.png'),
                                fit: BoxFit.cover
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
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("GRADE $grade",style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey
                        ),)
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text(name, style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700
                    ),),
                    Text('$subj Teacher', style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: darkBlue
                    ),),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("\$$price/session",style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                          ),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
