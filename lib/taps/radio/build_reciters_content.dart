import 'package:flutter/material.dart';
import 'package:islami_app/taps/radio/radio_item.dart';
import 'package:islami_app/taps/radio/radio_reciters_model/radio_reciters_model.dart';
import 'package:islami_app/taps/radio/radio_service.dart';
import 'package:islami_app/widgets/loading_indicator.dart';

class BuildRecitersContent extends StatelessWidget {
  const BuildRecitersContent({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: RadioService.GetRecitersData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(child: LoadingIndicator());
        } else if (snapshot.hasError) {
          return Text("Some thing wrong");
        }
        RadioRecitersModel radioRecitersResponseModel = snapshot.data!;
        return ListView.separated(
          itemBuilder: (_, index) => RadioItem(
            name: radioRecitersResponseModel.reciters![index].name ?? '',
            url:
                "${radioRecitersResponseModel.reciters![index].moshaf![0].server}010.mp3",
          ),
          separatorBuilder: (_, index) => SizedBox(height: 10),
          itemCount: 7,
        );
      },
    );
  }
}
