import 'package:client/constants.dart';
import 'package:client/pages/contentPage.dart';
import 'package:client/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();

  bool _passwordVisible = true;
  List typeUsers = ['Doctor', 'Users', 'Admin'];
  String? value;
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ContentPage();
            } else {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.arrow_back_ios),
                          color: Colors.black,
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(
                              vertical: kDefaultPadding,
                              horizontal: kDefaultPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome",
                                style: GoogleFonts.poppins(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                "to petcare application",
                                style: GoogleFonts.poppins(
                                  color: Colors.grey.shade400,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: kBackgroudColor),
                            ),
                            prefixIcon:
                                Icon(Icons.person, color: kBackgroudColor),
                            labelText: 'Fullname',
                            labelStyle: TextStyle(
                              color: kBackgroudColor,
                            ),
                            hintText: 'Enter your name',
                          ),
                        ),
                        SizedBox(height: kDefaultPadding + 10),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: kBackgroudColor),
                            ),
                            prefixIcon:
                                Icon(Icons.email, color: kBackgroudColor),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: kBackgroudColor,
                            ),
                            hintText: 'Enter your email',
                          ),
                        ),
                        SizedBox(height: kDefaultPadding + 10),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _passwordVisible,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: kBackgroudColor),
                            ),
                            prefixIcon:
                                Icon(Icons.lock, color: kBackgroudColor),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: kBackgroudColor,
                            ),
                            hintText: 'Enter your Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: kDefaultPadding + 10),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding,
                            vertical: kDefaultPadding / 4,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade400,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton(
                            style: TextStyle(
                              fontSize: 16,
                              color: kBackgroudColor,
                            ),
                            isExpanded: true,
                            hint: Text('Select type user'),
                            value: value,
                            onChanged: (value) => setState(() {
                              this.value = value as String?;
                            }),
                            items: typeUsers.map((value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: kDefaultPadding / 2),
                        SizedBox(height: kDefaultPadding / 2),
                        EvButton('Sign Up', kBackgroudColor, () async {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text);
                        }),
                        SizedBox(height: kDefaultPadding / 2),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "or",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: kDefaultPadding / 2),
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Image.asset(
                                    'assets/images/facebook-logo.png',
                                    height: 20,
                                  ),
                                ),
                                SizedBox(width: kDefaultPadding / 4),
                                Text(
                                  "Connect with Facebook",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: kDefaultPadding / 2),
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    child: Image.asset(
                                      'assets/images/google-logo.png',
                                      height: 20,
                                    ),
                                  ),
                                ),
                                SizedBox(width: kDefaultPadding / 4),
                                Text(
                                  "Connect with Goolgle",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: kDefaultPadding),
                        Align(
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "By signing in, I agree with ",
                                  style: GoogleFonts.poppins(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.0),
                                ),
                                TextSpan(
                                  text: "Terms of Use",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.0),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: kDefaultPadding / 4),
                        Align(
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "and",
                                  style: GoogleFonts.poppins(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.0),
                                ),
                                TextSpan(
                                  text: " Privacy Policy",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.0),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: kDefaultPadding,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}
