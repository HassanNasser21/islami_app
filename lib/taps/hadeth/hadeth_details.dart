import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/taps/quran/quran_service.dart';
import 'package:islami_app/taps/hadeth/hadeth.dart';
import 'package:islami_app/widgets/loading_indicator.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = '/hadeth_details';

  @override
  Widget build(BuildContext context) {
    double screenhight = MediaQuery.of(context).size.height;

   Hadeth hadeth= ModalRoute.of(context)!.settings.arguments as Hadeth  ;
   

    return Scaffold(
      appBar: AppBar(title: Text('Hadeth ${hadeth.num}')),
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
                    '${hadeth.title}',
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
          Expanded(
            child:  ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    itemBuilder: (context, index) => Text(
                      '${hadeth.content[index]}',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppTheme.primaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    itemCount: hadeth.content.length,
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                  ),
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
