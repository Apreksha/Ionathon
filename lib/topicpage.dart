import 'package:flutter/material.dart';
import 'package:ionathon/colorScheme.dart';

class Topic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [CustomAppBar(),
          CourseDescription(),
          Course_Progress()],
        ),
      ),
    );
  }
}


class CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Stack(
         children: [
           Column(
             children: [
               Container(
                 decoration: BoxDecoration(
                   border: Border.all(color: lightBlue),
                  // borderRadius: BorderRadius.circular(40)
                 ),
                 height: 300,
                 child: ClipRRect(borderRadius: BorderRadius.circular(40),
                 child: Image.asset("assets/abc.jpg",fit: BoxFit.fill,),),
               ),
               Container(
                 height: 20,
               )
             ],
           ),
           Positioned(
             bottom: 0,
             right: 40,
             child: Container(
               height: 50,
               width: 110,
               child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   primary: kAccent,
                   elevation: 0,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(15)
                   ),
                 ),
                 onPressed: (){},
                 child: Text('Start Class'),
               ),
             ),
           ),
           Positioned(
             top: MediaQuery.of(context).padding.top,
               left: 25,
               child: Container(
                 height: 50,
                 width: 50,
                 padding: EdgeInsets.only(left: 5),
                 decoration: BoxDecoration(
                   color: Colors.black.withOpacity(0.3),
                   borderRadius: BorderRadius.circular(15)
                 ),
                 child: IconButton(
                   icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                   iconSize: 20,
                   onPressed: ()=>Navigator.of(context).pop(),
                 ),
               )
           ),

         ],
       )
    );
  }
}

class CourseDescription extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("APPUSERIES",style: TextStyle(fontWeight: FontWeight.bold),),
              Container(height: 5,
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: 5,
              decoration: BoxDecoration(
                color: kFontLight,
                shape: BoxShape.circle
              ),
              ),
              Icon(Icons.access_time_filled,
              size: 20,
              color: kAccent,),
              SizedBox(width: 5,),
              Text('1H 35 MIN',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),)
            ],
          ),
          SizedBox(height: 15,),
          Text('Alphabets',style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,color: kFont
          ),),
          SizedBox(height: 15,),
          Text('Learn abc',style: TextStyle(
            wordSpacing: 2,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: kFontLight
          ),)
        ],
      ),
    );
  }
}

class Course_Progress extends StatelessWidget {
  final modulesList=Module.generateModules();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('The progress',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kFont
              ),),
            ],
          ),
          SizedBox(height: 20,),
          ...modulesList.map((e) => CourseModule(e)).toList()
        ],
      ),
    );
  }
}

class Module{
  late Color iconBorder;
  late Color iconBg;
  late Color iconColor;
  late IconData icon;
  late String title;
  late String desc;
  late Color moduleBorder;
  late Color moduleBg;
  late Color buttonColor;
  late Color buttonFont;
  late String time;
  late String lesson;

  Module(
      this.iconBorder,this.iconBg,this.iconColor,this.icon,
      this.time,this.desc,this.moduleBorder,this.moduleBg,
      this.buttonColor,this.buttonFont,this.title,this.lesson
      );

  static List<Module> generateModules(){
    return [
      Module(kAccent,
          kAccent,
          Colors.white,
          Icons.play_arrow_rounded,
          'Module 1',
          'Learn ABC',
          darkBlue,
          lightBlue,
          Colors.white,
          kPrimaryDark,
          '22 Min',
          '1 lesson'),

      Module(kFontLight.withOpacity(0.3),
          Colors.white,
          kFontLight.withOpacity(0.7),
          Icons.lock_outline_rounded,
          'Quiz',
          "Let's test your knowledge",
          darkBlue,
          Colors.white,
          Colors.grey.withOpacity(0.2),
          Colors.grey,
          '30 Min',
          '5 Questions'),

    ];
  }
}

class CourseModule extends StatelessWidget {
  final Module module;
  CourseModule(this.module);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Row(
        children: [
          Flexible(flex: 1,
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding:EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: module.iconBorder,
                    width: 2,),
                    color: module.iconBg,
                    shape: BoxShape.circle
                  ),
                  child: Icon(module.icon,size: 30,color: module.iconColor,),
                ),
                Expanded(child: Column(
                  children:
                    List.generate(20, (index) => Expanded(
                      child: Container(
                        width: 2,
                        color: index%2==0?Colors.transparent:module.iconBorder,
                      ),
                    ))
                ))
              ],
            )
          ),),
          Flexible(flex: 5,child: GestureDetector(
            onTap: (){print('tap');},
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: module.moduleBorder,width: 2),
                color: module.moduleBg,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        module.title,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: kFontLight,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Icon(Icons.more_horiz,color: kFontLight,)
                    ],
                  ),
                  SizedBox(height: 5,),
                  Text(module.desc,
                  style: TextStyle(
                    fontSize: 18,
                    color: kFont.withOpacity(0.7),
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 15,),
                  Row(
                    children: [_buildButton(Icons.access_time, module.time),
                      SizedBox(width: 10,),
                      _buildButton(Icons.bookmarks, module.lesson)],
                  )
                ],
              ),
            ),
          ),)
        ],
      ),
    );
  }

  _buildButton(IconData icon,String text){
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: module.buttonColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Icon(icon,size: 20,color:Colors.grey.shade500),// module.buttonColor,),
          SizedBox(width: 5,),
          Text(text,style: TextStyle(color: module.buttonFont,
          fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}