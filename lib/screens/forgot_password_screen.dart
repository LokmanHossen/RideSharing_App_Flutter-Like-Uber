import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:texi_ride_sharing_app_flutter/global/global.dart';

import 'login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailTextEiditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    firebaseAuth
        .sendPasswordResetEmail(email: emailTextEiditingController.text.trim())
        .then((value) {
      Fluttertoast.showToast(
          msg: "We send you an email to recover passowrd, please check email");
    }).onError(
      (error, stackTrace) {
        Fluttertoast.showToast(msg: "Error Occured: \n ${error.toString()}");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool darkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            Column(
              children: [
                Image.asset(
                  darkTheme
                      ? 'assets/images/city2.jpg'
                      : 'assets/images/city.jpeg',
                ),
                const SizedBox(height: 30),
                Text(
                  'Forgot Password Screen',
                  style: TextStyle(
                    color: darkTheme ? Colors.amber.shade400 : Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 17, 15, 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(100),
                              ],
                              decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                                filled: true,
                                fillColor: darkTheme
                                    ? Colors.black45
                                    : Colors.grey.shade300,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: darkTheme
                                      ? Colors.amber.shade400
                                      : Colors.grey,
                                ),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Email can\'t be emty';
                                }
                                if (EmailValidator.validate(text) == true) {
                                  return null;
                                }
                                if (text.length < 2) {
                                  return "Please enter a valid Email";
                                }
                                if (text.length > 99) {
                                  return "Email can't be more than 100";
                                }
                                return null;
                              },
                              onChanged: (text) => setState(
                                () {
                                  emailTextEiditingController.text = text;
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: darkTheme
                                      ? Colors.amber.shade400
                                      : Colors.blue,
                                  foregroundColor:
                                      darkTheme ? Colors.black : Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  minimumSize: const Size(double.infinity, 50)),
                              onPressed: () {
                                _submit();
                              },
                              child: const Text(
                                'Reset password link',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            const SizedBox(height: 7),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Already have an Account?",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(width: 1),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (c) =>
                                                const LoginScreen()));
                                  },
                                  child: Text(
                                    'LogIn',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: darkTheme
                                          ? Colors.amber.shade400
                                          : Colors.blue,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
