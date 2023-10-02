import 'package:flutter/material.dart';
import 'package:workiom_test1/Api_Service/api.dart';
import 'package:workiom_test1/Models/editions.dart';
import 'package:workiom_test1/components/cus_container_bottom.dart';
import 'package:workiom_test1/components/cus_container_google.dart';
import 'package:workiom_test1/components/cus_container_icon.dart';
import 'package:workiom_test1/components/cus_container_upper.dart';
import 'package:workiom_test1/components/cus_text.dart';
import 'package:workiom_test1/const//color.dart';
import 'package:workiom_test1/screens/email_pass_screen2.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  editions edition = editions();

  String? displayName;
  bool? isRegistrable;
  double? annualPrice;
  bool? hasTrial;
  bool? isMostPopular;
  int? id;

  Future<void> getEditionsForSelect() async {
    final response = await Api().get(
        uri:
            'http://api.workiom.site/api/services/app/TenantRegistration/GetEditionsForSelect');
    edition = editions
        .fromJson(response['result']['editionsWithFeatures'][0]['edition']);
  }

  @override
  void initState() {
    getEditionsForSelect();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 110,
          leading: TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: kAppbarBlue,
              ),
              label: Cus_Text(
                text: 'Sign in',
                size: 17,
                color: kAppbarBlue,
                fontWeight: FontWeight.normal,
              ))),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 19, bottom: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                width: 343,
                height: 470,
                child: Column(
                  children: [
                    CusUpper(
                        height: 22,
                        width: 22,
                        firstText: 'Create your free account',
                        secondText: "Let's start an amazing journey!"),
                    const SizedBox(height: 137),
                    Cus_Container(
                      text: "Continue with Google",
                      color: kGreyButton1,
                    ),
                    const SizedBox(height: 30),
                    Cus_Text(
                      text: "Or",
                      size: 12,
                      color: kGrey,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Cus_Container_Icon(
                        text: "Continue with email",
                        color: kBlue,
                        textColor: kWhite,
                        onTap: () {
                          id = edition.id;
                          displayName = edition.displayName;
                          isRegistrable = edition.isRegistrable;
                          annualPrice = edition.annualPrice;
                          hasTrial = edition.hasTrial;
                          isMostPopular = edition.isMostPopular;
                          if (id != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EmailPageTest(editionId: id!)),
                            );
                            //print('edition11111 === $id');
                          } else {
                            showDialog(
                                context: context,
                                builder: (_) => const AlertDialog(
                                      title: Text('warning'),
                                      content: Text("You can't Sign up"),
                                    ));
                          }
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    Cus_Text(
                        text:
                            "By signing up, you agree Terms Of Service \n And Privacy Policy",
                        size: 13,
                        color: kBlack2,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 63,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/globe.png',
                          width: 16,
                          height: 16,
                          color: kGrey,
                        ),
                        const SizedBox(width: 8),
                        Cus_Text(
                          text: 'English',
                          size: 12,
                          color: kGrey,
                          fontWeight: FontWeight.w400,
                        ),
                        const SizedBox(width: 8),
                        Image.asset('assets/polygon.png', width: 6, height: 4)
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const CusBottom()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
