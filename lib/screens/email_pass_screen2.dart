import 'package:flutter/material.dart';
import 'package:workiom_test1/Api_Service/api.dart';
import 'package:workiom_test1/Models/settings.dart';
import 'package:workiom_test1/components/cus_appbar.dart';
import 'package:workiom_test1/components/cus_bar.dart';
import 'package:workiom_test1/components/cus_container_bottom.dart';
import 'package:workiom_test1/components/cus_container_icon.dart';
import 'package:workiom_test1/components/cus_container_upper.dart';
import 'package:workiom_test1/components/cus_pass_field.dart';
import 'package:workiom_test1/components/cus_text.dart';
import 'package:workiom_test1/const/color.dart';
import 'package:workiom_test1/screens/tenant_screen3.dart';

class EmailPageTest extends StatefulWidget {
  const EmailPageTest({
    super.key,
    required this.editionId,
  });

  final int editionId;

  @override
  State<EmailPageTest> createState() => _EmailPageTestState();
}

class _EmailPageTestState extends State<EmailPageTest> {
  String _username = "";
  String _password = "";
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  Setting setting = Setting();

  bool _checkEmail = false;
  bool _hasDigit = false;
  bool _hasLowercase = false;
  bool _hasNonAlphanumeric = false;
  bool _hasUppercase = false;
  bool _hasRequiredLength = false;
  bool passwordVisible = true;

  Future<void> getPasswordComplexitySetting() async {
    final response = await Api().get(
        uri:
            'http://api.workiom.site/api/services/app/Profile/GetPasswordComplexitySetting');
    setting = Setting.fromJson(response['result']['setting']);
    //print('email ==  $response');
  }

  @override
  void initState() {
    getPasswordComplexitySetting();
    // TODO: implement initState
    super.initState();

    _usernameController = TextEditingController()
      ..addListener(() {
        setState(() {
          _username = _usernameController.text.trim();
        });
      });

    _passwordController = TextEditingController()
      ..addListener(() {
        setState(() {
          _password = _passwordController.text.trim();
        });
      });
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty &&
        _hasDigit &&
        _hasLowercase &&
        _hasNonAlphanumeric &&
        _hasUppercase &&
        _hasRequiredLength;
  }

  bool get _isFormValid => _checkEmail && _hasRequiredLength;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  double _checkPasswordConditions(String password) {
    int value = 0;
    if (_hasDigit) {
      value++;
    }
    if (_hasLowercase) {
      value++;
    }
    if (_hasNonAlphanumeric) {
      value++;
    }
    if (_hasUppercase) {
      value++;
    }
    if (_hasRequiredLength) {
      value++;
    }

    double progress = value / 5; // 4 is the number of conditions

    return progress;
  }

  @override
  Widget build(BuildContext context) {
    double progress = _checkPasswordConditions(_password);

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
                    firstText: 'Enter a strong password',
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
                        preffix: const Icon(
                          Icons.email_outlined,
                          size: 18,
                        ),
                        label: "Your work email",
                        onChanged: (value) {
                          _username = value;
                          _checkEmail = value.contains(RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-_]+\.[a-zA-Z]{2,}$',
                          ));
                        },
                        controller: _usernameController,
                        obscureText: false,
                        suffixIcon: Padding(
                          padding: const EdgeInsetsDirectional.only(start: 14),
                          child: IconButton(
                              color: kGrey,
                              onPressed: () {
                                setState(() {
                                  _usernameController.clear();
                                });
                              },
                              icon: const Padding(
                                padding: EdgeInsetsDirectional.only(start: 12),
                                child: Icon(
                                  Icons.highlight_remove,
                                  size: 24,
                                ),
                              )),
                        ),
                        hintText: 'Enter your email',
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Cus_Pass(
                        hintText: 'Enter your password',
                        preffix: Image.asset('assets/change-password.png',
                            width: 16, height: 18),
                        obscureText: passwordVisible,
                        label: "Your password",
                        controller: _passwordController,
                        onChanged: (value) {
                          _password = value;
                          _hasDigit = value.contains(RegExp(r'[0-9]'));
                          _hasLowercase = value.contains(RegExp(r'[a-z]'));
                          _hasNonAlphanumeric = value
                              .contains(RegExp(r'[!@#$%^&*()_+{}:;<>,.?~=-]'));
                          _hasUppercase = value.contains(RegExp(r'[A-Z]'));

                          if (setting.requiredLength != null) {
                            _hasRequiredLength = value.length >= 5;
                          }
                        },
                        suffixIcon: IconButton(
                            color: kGrey,
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                            icon: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 12),
                              child: Icon(
                                passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 24,
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomProgressBar(value: progress),
                      const SizedBox(
                        height: 9,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              _isPasswordValid()
                                  ? Image.asset(
                                      'assets/check1.png',
                                      width: 16,
                                      height: 16,
                                    )
                                  : Image.asset(
                                      'assets/info.png',
                                      width: 16,
                                      height: 16,
                                    ),
                              const SizedBox(
                                width: 8,
                              ),
                              Cus_Text(
                                text: "Not enough strong",
                                size: 15,
                                color: kBlack,
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          if (setting.requiredLength != null)
                            Row(
                              children: [
                                _hasRequiredLength
                                    ? Image.asset(
                                        'assets/check1.png',
                                        width: 16,
                                        height: 16,
                                      )
                                    : Image.asset(
                                        'assets/check2.png',
                                        width: 16,
                                        height: 16,
                                      ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Cus_Text(
                                  text:
                                      "Passwords must have at least ${setting.requiredLength} characters",
                                  size: 12,
                                  color: kBlack,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          const SizedBox(
                            height: 4,
                          ),
                          if (setting.requireUppercase == true)
                            Row(
                              children: [
                                _hasUppercase
                                    ? Image.asset(
                                        'assets/check1.png',
                                        width: 16,
                                        height: 16,
                                      )
                                    : Image.asset(
                                        'assets/check2.png',
                                        width: 16,
                                        height: 16,
                                      ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Cus_Text(
                                  text:
                                      "Passwords must have at least one uppercase ('A'-'Z').",
                                  size: 12,
                                  color: kBlack,
                                  fontWeight: FontWeight.w400,
                                )
                              ],
                            )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Cus_Container_Icon(
                        text: "Confirm password",
                        color: _isFormValid ? kBlue : kGreyButton2,
                        textColor: kWhite,
                        onTap: () {
                          _isFormValid
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TenantScreen(
                                        email: _usernameController.text,
                                        password: _passwordController.text,
                                        editionId: widget.editionId),
                                  ),
                                )
                              : null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 136,
                ),
                const CusBottom()
              ],
            ),
          ),
        ));
  }
}
