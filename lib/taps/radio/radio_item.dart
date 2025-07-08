import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';

class RadioItem extends StatelessWidget {
  const RadioItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 133,
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: AssetImage('assets/images/radioBackground_Image.png'), fit: BoxFit.fill,),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Radio Ibrahim Al-Akdar', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppTheme.black),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/stop_audio.png', height: 50, width: 50),
              SizedBox(width: 13),
              Image.asset('assets/images/speaker.png', height: 25, width: 25),
            ],
          )
        ],
      ),
    );
  }
}