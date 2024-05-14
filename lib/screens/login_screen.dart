import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:texi_ride_sharing_app_flutter/screens/forgot_password_screen.dart';
import 'package:texi_ride_sharing_app_flutter/screens/register_screen.dart';

import '../global/global.dart';
import 'main_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailTextEiditingController = TextEditingController();
  final passwordTextEiditingController = TextEditingController();

  bool _passwordvisible = false;
  final _formKey = GlobalKey<FormState>();
  void _submit() async {
    if (_formKey.currentState!.validate()) {
      await firebaseAuth
          .signInWithEmailAndPassword(
              email: emailTextEiditingController.text.trim(),
              password: passwordTextEiditingController.text.trim())
          .then((auth) {
        currentUser = auth.user;

        Fluttertoast.showToast(msg: "Successfully Loged In".toString());
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const MainPage()));
      }).catchError((errorMessage) {
        Fluttertoast.showToast(msg: "Error occured: \n $errorMessage");
      });
    } else {
      Fluttertoast.showToast(msg: "Not all field are valid");
    }
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
                  'LogIn',
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
                            // const SizedBox(height: 20),
                            // IntlPhoneField(
                            //   showCountryFlag: false,
                            //   decoration: InputDecoration(
                            //     hintText: 'Enter your phone',
                            //     hintStyle: const TextStyle(
                            //       color: Colors.grey,
                            //     ),
                            //     filled: true,
                            //     fillColor: darkTheme
                            //         ? Colors.black45
                            //         : Colors.grey.shade300,
                            //     border: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(30),
                            //       borderSide: const BorderSide(
                            //         width: 0,
                            //         style: BorderStyle.none,
                            //       ),
                            //     ),
                            //   ),
                            //   initialCountryCode: 'BD',
                            //   onChanged: (text) => setState(
                            //     () {
                            //       phoneTextEiditingController.text =
                            //           text.completeNumber;
                            //     },
                            //   ),
                            // ),
                            // const SizedBox(height: 20),
                            // TextFormField(
                            //   inputFormatters: [
                            //     LengthLimitingTextInputFormatter(100),
                            //   ],
                            //   decoration: InputDecoration(
                            //     hintText: 'Address',
                            //     hintStyle: const TextStyle(
                            //       color: Colors.grey,
                            //     ),
                            //     filled: true,
                            //     fillColor: darkTheme
                            //         ? Colors.black45
                            //         : Colors.grey.shade300,
                            //     border: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(30),
                            //       borderSide: const BorderSide(
                            //         width: 0,
                            //         style: BorderStyle.none,
                            //       ),
                            //     ),
                            //     prefixIcon: Icon(
                            //       Icons.location_city_outlined,
                            //       color: darkTheme
                            //           ? Colors.amber.shade400
                            //           : Colors.grey,
                            //     ),
                            //   ),
                            //   autovalidateMode:
                            //       AutovalidateMode.onUserInteraction,
                            //   validator: (text) {
                            //     if (text == null || text.isEmpty) {
                            //       return 'address can\'t be emty';
                            //     }

                            //     if (text.length < 2) {
                            //       return "Please enter a valid address";
                            //     }
                            //     if (text.length > 99) {
                            //       return "address can't be more than 100";
                            //     }
                            //     return null;
                            //   },
                            //   onChanged: (text) => setState(
                            //     () {
                            //       addressTextEiditingController.text = text;
                            //     },
                            //   ),
                            // ),
                            const SizedBox(height: 20),
                            TextFormField(
                              obscureText: !_passwordvisible,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(100),
                              ],
                              decoration: InputDecoration(
                                hintText: 'Password',
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
                                  Icons.password_sharp,
                                  color: darkTheme
                                      ? Colors.amber.shade400
                                      : Colors.grey,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _passwordvisible = !_passwordvisible;
                                    });
                                  },
                                  icon: Icon(
                                    _passwordvisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: darkTheme
                                        ? Colors.amber.shade400
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Password can\'t be emty';
                                }
                                if (text.length < 6) {
                                  return "Please enter a valid password";
                                }
                                if (text.length > 49) {
                                  return "password can't be more than 100";
                                }
                                return null;
                              },
                              onChanged: (text) => setState(
                                () {
                                  passwordTextEiditingController.text = text;
                                },
                              ),
                            ),
                            const SizedBox(height: 20),

                            // TextFormField(
                            //   obscureText: !_passwordvisible,
                            //   inputFormatters: [
                            //     LengthLimitingTextInputFormatter(100),
                            //   ],
                            //   decoration: InputDecoration(
                            //     hintText: 'Confirm Password',
                            //     hintStyle: const TextStyle(
                            //       color: Colors.grey,
                            //     ),
                            //     filled: true,
                            //     fillColor: darkTheme
                            //         ? Colors.black45
                            //         : Colors.grey.shade300,
                            //     border: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(30),
                            //       borderSide: const BorderSide(
                            //         width: 0,
                            //         style: BorderStyle.none,
                            //       ),
                            //     ),
                            //     prefixIcon: Icon(
                            //       Icons.password_sharp,
                            //       color: darkTheme
                            //           ? Colors.amber.shade400
                            //           : Colors.grey,
                            //     ),
                            //     suffixIcon: IconButton(
                            //       onPressed: () {
                            //         setState(() {
                            //           _passwordvisible = !_passwordvisible;
                            //         });
                            //       },
                            //       icon: Icon(
                            //         _passwordvisible
                            //             ? Icons.visibility
                            //             : Icons.visibility_off,
                            //         color: darkTheme
                            //             ? Colors.amber.shade400
                            //             : Colors.grey,
                            //       ),
                            //     ),
                            //   ),
                            //   autovalidateMode:
                            //       AutovalidateMode.onUserInteraction,
                            //   validator: (text) {
                            //     if (text == null || text.isEmpty) {
                            //       return 'confirm Password can\'t be emty';
                            //     }
                            //     if (text !=
                            //         passwordTextEiditingController.text) {
                            //       return "Password not match";
                            //     }
                            //     if (text.length < 6) {
                            //       return "Please enter a valid password";
                            //     }
                            //     if (text.length > 49) {
                            //       return "password can't be more than 50";
                            //     }
                            //     return null;
                            //   },
                            //   onChanged: (text) => setState(
                            //     () {
                            //       confirmTextEiditingController.text = text;
                            //     },
                            //   ),
                            // ),

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
                                'LogIn',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgotPasswordScreen(),
                                    ));
                              },
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(
                                  color: darkTheme
                                      ? Colors.amber.shade400
                                      : Colors.blue,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            const SizedBox(height: 7),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "You have don't Account?",
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
                                            builder: (c) => const RegisterScreen()));
                                  },
                                  child: Text(
                                    'Sihn Up',
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
