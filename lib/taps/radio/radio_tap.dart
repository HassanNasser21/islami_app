import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/taps/radio/build_radio_content.dart';
import 'package:islami_app/taps/radio/build_reciters_content.dart';
import 'package:islami_app/taps/radio/build_tap_header.dart';


class RadioTap extends StatefulWidget {
  const RadioTap({super.key});

  @override
  State<RadioTap> createState() => _RadioTapState();
}

class _RadioTapState extends State<RadioTap> {
  bool isRadioSelected = true;

  @override
  Widget build(BuildContext context) {
    final double halfWidth = MediaQuery.of(context).size.width * 0.45;

    return Column(
      children: [
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BuildTapHeader(
              label: 'Radio',
              selected: isRadioSelected,
              width: halfWidth,
              onTap: () => setState(() => isRadioSelected = true),
            ),
            BuildTapHeader(
              label: 'Reciters',
              selected: !isRadioSelected,
              width: halfWidth,
              onTap: () => setState(() => isRadioSelected = false),
            ),
          ],
        ),
        const SizedBox(height: 16),
        isRadioSelected ? BuildRadioContent() : BuildRecitersContent(),
      ],
    );
  }
}
