import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/taps/radio/provider/radio_provider.dart';
import 'package:provider/provider.dart';

class RadioItem extends StatefulWidget {
  String name;
  String url;
  bool isVolumeUp = true;
  RadioItem({super.key, required this.name, required this.url});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RadioProvider>(
      builder: (context, value, child) => Container(
        height: 133,
        decoration: BoxDecoration(
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage('assets/images/radioBackground_Image.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.name,
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(color: AppTheme.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    value.play(widget.url);
                  },
                  icon: Icon(
                    (value.isPlaying && value.currentPlayingUrl == widget.url)
                        ? Icons.pause
                        : Icons.play_arrow,
                  ),
                  color: AppTheme.black,
                  iconSize: 30,
                ),
                IconButton(
                  onPressed: () {
                    if (value.currentPlayingUrl == widget.url &&
                        value.isPlaying) {
                      value.stop();
                    }
                  },
                  icon: Icon(Icons.stop),
                  color: AppTheme.black,
                  iconSize: 30,
                ),
                IconButton(
                  onPressed: () {
                    if (widget.isVolumeUp) {
                      value.setVolume(0);
                      widget.isVolumeUp = false;
                    } else {
                      value.setVolume(1);
                      widget.isVolumeUp = true;
                    }
                  },
                  icon: Icon(
                    widget.isVolumeUp ? Icons.volume_up : Icons.volume_off,
                  ),
                  color: AppTheme.black,
                  iconSize: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
