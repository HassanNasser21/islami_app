import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/taps/hadeth/hadeth.dart';
import 'package:islami_app/taps/hadeth/hadeth_details.dart';
import 'package:islami_app/widgets/loading_indicator.dart';

class HadethItem extends StatefulWidget {
  int index;
  HadethItem({super.key, required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;
  @override
  Widget build(BuildContext context) {
    if (hadeth == null) {
      loadHadeth();
    }
    double screenheight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          HadethDetails.routeName,
          arguments: hadeth,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/hadeth_header_left.png',
                    height: screenheight * 0.1,
                    fit: BoxFit.fill,
                  ),
                  if (hadeth != null)
                    Expanded(
                      child: Text(
                        hadeth!.title,
                        style: Theme.of(context).textTheme.headlineSmall!
                            .copyWith(color: AppTheme.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  Image.asset(
                    'assets/images/hadeth_header_right.png',
                    height: screenheight * 0.1,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/hadeth_card_background.png'),
                  ),
                ),
      
                child: hadeth == null
                    ? LoadingIndicator()
                    : ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemBuilder: (_, index) => Text(
                          hadeth!.content[index],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(color: AppTheme.black),
                        ),
                        separatorBuilder: (_, _) => SizedBox(height: 4),
                        itemCount: hadeth!.content.length,
                      ),
              ),
            ),
            Image.asset(
              'assets/images/hadeth_footer.png',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadHadeth() async {
    String hadethcontent = await rootBundle.loadString(
      'assets/text/h${widget.index + 1}.txt',
    );
    List<String> hadethlines = hadethcontent.split('\n');
    String title = hadethlines[0];
    hadethlines.removeAt(0);
    List<String> content = hadethlines;
    hadeth = Hadeth(title: title, content: content, num: widget.index + 1);
    if (mounted) {
      setState(() {});
    }
  }
}
