import 'package:flutter/material.dart';
import 'package:workiom_test1/components/cus_container_bottom.dart';
import 'package:workiom_test1/components/cus_text.dart';
import 'package:workiom_test1/const/color.dart';

class ThanksPage extends StatelessWidget {
  const ThanksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 19, bottom: 26),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Cus_Text(
                        text: 'Thank you for choosing \n Workiom',
                        size: 22,
                        color: kBlack,
                        fontWeight: FontWeight.w600,
                      ),
                      Positioned(
                        top: 37,
                        left: 112,
                        child: Image.asset(
                          'assets/workiom_logo_clr.png',
                          width: 23.2,
                          height: 15.4,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Align(alignment: Alignment.bottomCenter, child: CusBottom()),
          ],
        ),
      ),
    );
  }
}
