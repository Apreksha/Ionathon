import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionathon/colorScheme.dart';
import 'package:ionathon/offsetProvider.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}
late HomePageState homePageState;

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late AnimationController animationController;


  @override
  void initState() {
    // TODO: implement initState

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 15),
    );
    animationController.addListener(() {
      setState(() {

      });
    });

    animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor:
        SystemUiOverlayStyle.dark.systemNavigationBarColor,
      ),
    );
    return AnimatedContainer(
      transform: Matrix4Transform()
          .translate(x: context.watch<offsetProvider>().xoffsetHome, y: context.watch<offsetProvider>().yoffSetHome)
          .rotate(context.watch<offsetProvider>().angleHome)
          .matrix4,
      duration: Duration(milliseconds: 250),
      child: Scaffold(
        backgroundColor: lightBlue,
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
              child: IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                  size: 30,
                ), onPressed: () {  },
              ),
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
                      ],
                    ),
                    Expanded(
                      child: ListView(
                        children:[ Column(
                          children: [
                            tutorWidget("assets/english.png", "English", "5",0.50),
                            tutorWidget("assets/french.png", "French","5",0.75),
                            tutorWidget("assets/math.png","Maths","5",0.25),
                            tutorWidget("assets/science.png", "Science", "5",0.50),
                            tutorWidget("assets/social-science.png", "Social Science", "5",0.25),
                          ],
                        ),]
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
  InkWell tutorWidget(String img, String subj, String grade,double per)
  {
    //final percentage = animationController.value * 100;
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
                              image: AssetImage('assets/iconBgNew.png'),
                              fit: BoxFit.contain
                          )
                      ),
                    ),
                  ),
                  Positioned(
                    left: 50,
                    bottom: 50,
                    child: Hero(
                      tag: img,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(img),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    Text(subj, style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700
                    ),),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: LiquidCircularProgressIndicator(
                        backgroundColor: darkBlue,
                        valueColor: AlwaysStoppedAnimation(pink),
                        value: per,
                        center: Text('${(per*100).toInt()}%',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                            color: Colors.black,
                          ),),
                        borderColor: Colors.black,
                        borderWidth: 1.0,
                        direction: Axis.vertical,
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
