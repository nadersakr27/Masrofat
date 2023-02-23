import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../functions.dart';
import '../widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController pass = TextEditingController();
  late String email;
  late String password;
  late String repassword;
  final formState = GlobalKey<FormState>();
  onsaved() async {
    var formdata = formState.currentState;

    if (formdata!.validate()) {
      formdata.save();
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        Navigator.of(context).pushReplacementNamed("home");
      } on FirebaseAuthException catch (e) {
        if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Email is already in has acount'),
                duration: Duration(seconds: 2)),
          );
        } else if (e.code == "weak-password") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text("Password is too weak"),
                duration: Duration(seconds: 2)),
          );
        }
        print(e.code);
      }

      // Navigator.of(context).pushReplacementNamed("home");
    }
  }

  @override
  Widget build(BuildContext context) {
    var mobilewidth = MediaQuery.of(context).size.width;
    var mobileheight = MediaQuery.of(context).size.height;
    var height = mobileheight / 30;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: !false,

        body: Padding(
          padding: const EdgeInsets.all(26),
          child: Form(
            key: formState,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: height * 2,
                ),
                Image.asset("images/a.png",
                    height: mobileheight / 3.8),
                SizedBox(
                  height: height * 2,
                ),
                textfield(icon: Icons.email_outlined,
                    f: (val) {
                      if (val != null) {
                        setState(() {
                          email = val;
                        });
                      }
                    },
                    fun: emailvaildatorfun,
                    height: height,
                    text: "E-mail",
                    keyboard: TextInputType.emailAddress),
                SizedBox(
                  height: height / 1.5,
                ),
                textfield(icon: Icons.lock_outline_rounded,
                    control: pass,
                    obscureText2: true,
                    f: (val) {
                      if (val != null) {
                        setState(() {
                          password = val;
                        });
                      }
                    },
                    height: height,
                    text: "Password",
                    fun: passwordvaildatorfun),
                SizedBox(
                  height: height / 1.5,
                ),
                textfield(
                  icon: Icons.lock_outline_rounded,
                    obscureText2: true,
                    f: (val) {
                      if (val != null) {
                        setState(() {
                          repassword = val;
                        });
                      }
                    },
                    height: height,
                    text: "Repeat Password",
                    fun: (text) {
                      if (text == null) {
                        return "Please enter repeat password";
                      }
                      if (text.isEmpty) {
                        return "Please enter repeat password";
                      }
                      if (text != pass.text) {
                        return "Repeated password isn't eqaul password";
                      }
                      return null;
                    }),
                SizedBox(
                  height: height * 2,
                ),
                button(
                    fun: onsaved,
                    mobilewidth: mobilewidth,
                    mobileheight: mobileheight,
                    text: "Sign Up"),
                SizedBox(
                  height: height / 3,
                ),
                buttonoutline(
                    mobilewidth: mobilewidth,
                    mobileheight: mobileheight,
                    text: "Sign In With Google"),
              ],
            ),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
