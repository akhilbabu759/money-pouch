import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:moneypouch/pages/home.dart';

import 'one time/welcome.dart';

class IntroductionScreens extends StatefulWidget {
  const IntroductionScreens({Key? key}) : super(key: key);

  @override
  State<IntroductionScreens> createState() => _IntroductionScreensState();
}

class _IntroductionScreensState extends State<IntroductionScreens> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Title of 1st Page',
              body: 'hji',
              image: buildImage("images/image_1.png"),
             
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Title of 2nd Page',
              body: 'Body of 2nd Page',
              image: buildImage("images/image_2.png"),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Title of 3rd Page',
              body: 'Body of 3rd Page',
              image: buildImage("images/image_3.png"),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
          ],
          onDone: () {
             Navigator.of(context).pushReplacement(
           MaterialPageRoute(builder: (context) =>  Home()));

            if (kDebugMode) {
              print("Done clicked");
            }
          },
          //ClampingScrollPhysics prevent the scroll offset from exceeding the bounds of the content.
          scrollPhysics: const ClampingScrollPhysics(),
          showDoneButton: true,
          showNextButton: true,
          showSkipButton: true,
          isBottomSafeArea: true,
          skip:
              const Text("Skip", style: TextStyle(fontWeight: FontWeight.w600)),
          next: const Icon(Icons.forward),
          done:
              const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
          dotsDecorator: getDotsDecorator()),
    );
  }

  //widget to add the image on screen
  Widget buildImage(String imagePath) {
    return Center(
        child: Image.asset(
      'assets/images/download.jpg',
      width: 450,
      height: 200,
    ));
  }

  //method to customise the page style
  PageDecoration getPageDecoration() {
    return const PageDecoration(
      imagePadding: EdgeInsets.only(top: 120),
      pageColor: Colors.white,
      bodyPadding: EdgeInsets.only(top: 8, left: 20, right: 20),
      titlePadding: EdgeInsets.only(top: 50),
      bodyTextStyle: TextStyle(color: Colors.black54, fontSize: 15),
    );
  }

  //method to customize the dots style
  DotsDecorator getDotsDecorator() {
    return const DotsDecorator(
      spacing: EdgeInsets.symmetric(horizontal: 4),
      activeColor: Colors.indigo,
      color: Colors.grey,
      activeSize: Size(12, 9),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }
}