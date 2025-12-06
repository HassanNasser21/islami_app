import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/taps/quran/quran_service.dart';
import 'package:islami_app/taps/hadeth/hadeth.dart';
import 'package:islami_app/taps/time/askar_model.dart';
import 'package:islami_app/widgets/loading_indicator.dart';

class AzkarScreenDetails extends StatefulWidget {
  static const String routeName = '/azkar_details';

  @override
  State<AzkarScreenDetails> createState() => _AzkarScreenDetailsState();
}

class _AzkarScreenDetailsState extends State<AzkarScreenDetails> {
  @override
  Widget build(BuildContext context) {
    double screenhight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text('Morning Azkar')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/details_header_left.png',
                  height: screenhight * 0.1,
                  fit: BoxFit.fill,
                ),
                Expanded(
                  child: Text(
                    'Morning Azkar',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset(
                  'assets/images/details_header_right.png',
                  height: screenhight * 0.1,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: AskarModel.getAskar("أذكار الصباح"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(child: LoadingIndicator());
              } else if (snapshot.hasError) {
                return Text("Some thing wrong");
              }
              List<AskarModel> askar = snapshot.data!;

              return Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  itemBuilder: (context, index) => Container(
                    width: double.infinity,
                    height: 150,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.black,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppTheme.primaryColor),
                    ),
                    child: Column(
                      children: [
                          Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppTheme.primaryColor),
                             
                            ),
                            child: AutoSizeText(
                              askar[index].count!,
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                color: AppTheme.primaryColor,
                              ),
                             
                            ),
                          ),
                        ),
                        Flexible(
                          child: AutoSizeText(
                            askar[index].content!,
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: AppTheme.primaryColor,
                            ),
                            textAlign: TextAlign.right,
                            
                          
                          ),
                        ),
                      
                      ],
                    ),
                  ),
                  itemCount: askar.length,
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                ),
              );
            },
          ),

          Image.asset(
            'assets/images/details_footer.png',
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
