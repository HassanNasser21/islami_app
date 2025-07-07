import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/taps/quran/quran_service.dart';
import 'package:islami_app/taps/quran/sura.dart';
import 'package:islami_app/widgets/loading_indicator.dart';

class SuraDetails extends StatefulWidget {
  SuraDetails({super.key});
  static const routeName = '/sura_details';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late Sura sura;

  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    double screenhight = MediaQuery.of(context).size.height;

    sura = ModalRoute.of(context)!.settings.arguments as Sura;
    if (ayat.isEmpty) {
      loadSura();
    }

    return Scaffold(
      appBar: AppBar(title: Text('${sura.englishName}')),
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
                Text(
                  '${sura.arabicName}',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).primaryColor,
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
            child: ayat.isEmpty
                ? LoadingIndicator()
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    itemBuilder: (context, index) => Text(
                      '${ayat[index]}',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppTheme.primaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    itemCount: ayat.length,
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

  Future<void> loadSura() async {
    String suracontent = await QuranService.loadsurafile(sura.numberofsura);
    ayat = suracontent.split('\r\n');
    setState(() {});
  }
}
