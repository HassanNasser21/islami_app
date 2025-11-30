import 'package:flutter/material.dart';
import 'package:islami_app/taps/radio/radio_item.dart';
import 'package:islami_app/taps/radio/radio_response_model/radio_response_model.dart';
import 'package:islami_app/taps/radio/radio_service.dart';
import 'package:islami_app/widgets/loading_indicator.dart';

class BuildRadioContent extends StatelessWidget {
  const BuildRadioContent({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: RadioService.GetRadioData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(child: LoadingIndicator());
        } else if (snapshot.hasError) {
          return Text("Some thing wrong");
        }
        RadioResponseModel radioResponseModel = snapshot.data!;
        return ListView.separated(
          itemBuilder: (_, index) => RadioItem(
            name: radioResponseModel.radios![index].name ?? '',
            url: radioResponseModel.radios![index].url ?? '',
          ),
          separatorBuilder: (_, index) => SizedBox(height: 10),
          itemCount: 7,
        );
      },
    );
  }
}
