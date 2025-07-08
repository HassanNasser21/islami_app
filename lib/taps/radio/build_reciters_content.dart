import 'package:flutter/material.dart';
import 'package:islami_app/taps/radio/radio_item.dart';

class BuildRecitersContent extends StatelessWidget {
  const BuildRecitersContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (_, index) => RadioItem(),
        separatorBuilder: (_, index) => SizedBox(height: 10),
        itemCount: 7,
      ),
    );
  }
}