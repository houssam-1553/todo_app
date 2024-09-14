import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:todo_app/screens/onbrd/onboardingController.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(Onboardingcontroller());
  
     double width = MediaQuery.sizeOf(context).width;
double height = MediaQuery.sizeOf(context).height;
bool dark = isdark(context);
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 80),
        child: Stack(
          
          children: [
            
        
           PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePage,
            children: [
             OnboardingPage(width: width, height: height,imageasset: "assets/images/undraw.png",title: "Welcome in ToDo App",subtitle: "increase your productivity",), 
            OnboardingPage(width: width, height: height,imageasset: "assets/images/undraw3.png",title: "Create and complete daily Tasks",subtitle: "make sure to finish on time",), 
            OnboardingPage(width: width*0.7, height: height*0.8,imageasset: "assets/images/undraw2.png",title: "Cheked day\n= Good night!",subtitle: "you will feel it no doubt",), 

           ],), 
           Positioned(
            bottom: 25,
            left: 10,
            
            
            child: SmoothPageIndicator(controller: controller.pageController,
            
            onDotClicked: controller.dotClicked,
             count: 3,effect: ExpandingDotsEffect(dotHeight: 10 ,dotColor: dark ? Colors.white:Colors.black),)),
            Positioned(
              right: 1,
              bottom: 10,
              child: ElevatedButton(onPressed: controller.nextPage, style: ElevatedButton.styleFrom(shape: const CircleBorder()),child: const Icon(Icons.arrow_right_alt_outlined,size: 30,)))
        
        
        ],),
      ),
    );
  }
}
 bool isdark (BuildContext context){
  return Theme.of(context).brightness == Brightness.dark;

}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.width,
    required this.height,
    required this.imageasset,
    required this.title,
    required this.subtitle,

  });

  final double width;
  final double height;
  final String title,subtitle,imageasset;

  @override
  Widget build(BuildContext context) {
    return PageView(
      
      children: [
    
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 80),
        child: Column(
          children: [
        Image.asset(imageasset,width: width*0.8,), 
        SizedBox(height: height*0.1,),
        Text(title , style:Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,)    , 
        SizedBox(height: height*0.01,),
        Text(subtitle, style:Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.center,) ,        
        
        
        ],),
      )
    ],);
  }
}