import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/config/fonts.dart';


class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            
                
            Image.asset("assets/images/logo.png",width: width*0.35,),
            const SizedBox(height: 20,),
            Text("ToDo App" , style:Theme.of(context).textTheme.headlineMedium,)
                
                
          ],),
        ),
      
    );
  }
}