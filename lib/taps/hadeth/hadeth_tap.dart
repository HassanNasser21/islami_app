import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/taps/hadeth/hadeth_item.dart';

class HadethTap extends StatelessWidget {
  const HadethTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 12,bottom: 20),
      child: CarouselSlider.builder(
        itemCount: 50, 
        itemBuilder: (_, index, realIndex) => HadethItem(index: index,),
         options: CarouselOptions(
           height: double.infinity,
           enlargeCenterPage: true,
           enlargeFactor: 0.2,
           
         )),
    );
  }
}