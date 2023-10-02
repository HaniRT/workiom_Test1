import 'package:flutter/material.dart';
import 'package:workiom_test1/Api_Service/api.dart';
import 'package:workiom_test1/components/cus_appbar.dart';
import 'package:workiom_test1/components/cus_container_bottom.dart';
import 'package:workiom_test1/components/cus_container_icon.dart';
import 'package:workiom_test1/components/cus_container_upper.dart';
import 'package:workiom_test1/components/cus_pass_field.dart';
import 'package:workiom_test1/const/color.dart';
import 'package:workiom_test1/screens/thanks_screen4.dart';

class TenantScreen extends StatefulWidget {
  const TenantScreen({
    super.key,
    required this.email,
    required this.password,
    required this.editionId,
  });

  final String email;
  final String password;
  final int editionId;

  @override
  State<TenantScreen> createState() => _TenantScreenState();
}

class _TenantScreenState extends State<TenantScreen> {
  String _tenant = "";
  String _firstname = "";
  String _lastname = "";
  late final TextEditingController _tenantController;
  late final TextEditingController _firstnameController;
  late final TextEditingController _lastnameController;

  bool _checkTenant = false;
  bool _checkFirstName = false;
  bool _checkLastName = false;
  final String timeZone1 = 'Europe/Istanbul';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tenantController = TextEditingController()
      ..addListener(() {
        setState(() {
          _tenant = _tenantController.text.trim();
        });
      });

    _firstnameController = TextEditingController()
      ..addListener(() {
        setState(() {
          _firstname = _firstnameController.text.trim();
        });
      });

    _lastnameController = TextEditingController()
      ..addListener(() {
        setState(() {
          _lastname = _lastnameController.text.trim();
        });
      });
  }

  bool get _isForm2Valid => _checkTenant && _checkFirstName && _checkLastName;

  Future checkTenantAvailability() async {
    const String url =
        'http://api.workiom.site/api/services/app/Account/IsTenantAvailable';

    final body = {'tenancyName': _tenant};
    final response = await Api().post(url: url, body: body);
    //print('1111111111 = $response');

    return response;
  }

  Future<void> registerTenant() async {
    const String url =
        'http://api.workiom.site/api/services/app/TenantRegistration/RegisterTenant';

    final body = {
      "tenancyName": _tenant,
      "name": _tenant,
      "adminEmailAddress": widget.email,
      "adminFirstName": _firstnameController.text,
      "adminLastName": _lastnameController.text,
      "adminPassword": widget.password,
      "editionId": widget.editionId,
    };

    final response = await Api().post(
      url: url,
      body: body,
      parameters: {"timeZone": timeZone1},
    );
    //print('Response data: ${response}');
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: cus_appbar(() {
          Navigator.pop(context);
        }),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 19, bottom: 26),
            child: Column(
              children: [
                CusUpper(
                    height: 22,
                    width: 22,
                    firstText: "Enter your company name",
                    secondText: "Let's start an amazing journey!"),
                const SizedBox(
                  height: 80,
                ),
                Container(
                  width: double.infinity,
                  height: 342,
                  child: Column(
                    children: [
                      Cus_Pass(
                        hintText: 'Workspace name*',
                        suffixText: ".workiom.com",
                        controller: _tenantController,
                        label: 'Your company or team name',
                        obscureText: false,
                        preffix: const Icon(
                          Icons.groups_sharp,
                          size: 18,
                        ),
                        onChanged: (value) {
                          _tenant = value;
                          _checkTenant = value
                              .contains(RegExp(r'^[a-zA-Z][a-zA-Z0-9-]*$'));
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Cus_Pass(
                        hintText: 'Enter your First name',
                        controller: _firstnameController,
                        label: 'Your  first name',
                        obscureText: false,
                        preffix: Image.asset('assets/text.png',
                            width: 16, height: 18),
                        onChanged: (value) {
                          _firstname = value;
                          _checkFirstName =
                              value.contains(RegExp(r'^[a-zA-Z]+$'));
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Cus_Pass(
                        hintText: 'Enter your Last name',
                        controller: _lastnameController,
                        label: 'Your  last name',
                        obscureText: false,
                        preffix: Image.asset('assets/text.png',
                            width: 16, height: 18),
                        onChanged: (value) {
                          _lastname = value;
                          _checkLastName =
                              value.contains(RegExp(r'^[a-zA-Z]+$'));
                        },
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      Cus_Container_Icon(
                          text: 'Create Workspace',
                          color: _isForm2Valid ? kBlue : kGreyButton2,
                          textColor: kWhite,
                          onTap: () async {
                            final isTenantAvailable =
                                await checkTenantAvailability();

                            if (isTenantAvailable == null) {
                              await registerTenant();

                              _isForm2Valid
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ThanksPage()),
                                    )
                                  : null;
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (_) => const AlertDialog(
                                        title: Text('warning'),
                                        content: Text(
                                            'Tenant name is already exist'),
                                      ));
                            }
                          }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 136,
                ),
                const CusBottom(),
              ],
            ),
          ),
        ));
  }
}
