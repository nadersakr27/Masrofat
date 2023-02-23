import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets.dart';
import '../functions.dart';
import 'package:masrofat/color.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late String? email;
  late String? password;
  final formState = GlobalKey<FormState>();
  onsaved() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      formdata.save();
      print(email);
      print(password);
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email!, password: password!);
        Navigator.of(context).pushReplacementNamed("home");
      } on FirebaseAuthException catch (e) {
        if (e.code == "wrong-password") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Wrong Password'),
                duration: Duration(seconds: 2)),
          );
        } else if (e.code == "user-not-found") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text("This email hasn't account, try to sign"),
                duration: Duration(seconds: 3)),
          );
        }
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
                textfield( // email text field
                icon: Icons.email_outlined,
                    f: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                    fun: emailvaildatorfun,
                    height: height,
                    text: "E-mail",
                    keyboard: TextInputType.emailAddress),
                SizedBox(
                  height: height / 1.5,
                ),
                textfield(//password text field 
                    icon: Icons.lock_outline_rounded,
                    obscureText2: true,
                    f: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                    height: height,
                    text: "Password",
                    fun: passwordvaildatorfun),
                    TextButton(onPressed:(){},child: SizedBox(child: Text("Forget Passwor?",style:GoogleFonts.montserrat(color: Appcolor.third))),),
                SizedBox(
                  height: height * 2,
                ),
                button(
                    fun: onsaved,
                    text: "Sign In",
                    mobileheight: mobileheight,
                    mobilewidth: mobilewidth),
                SizedBox(
                  height: height / 3,
                ),
                buttonoutline(
                    fun: () {
                      Navigator.of(context).pushNamed("SignUp");
                    },
                    mobilewidth: mobilewidth,
                    mobileheight: mobileheight,
                    text: "Sign Up"),
                SizedBox(
                  height: height / 3,
                ),
                
              ],
            ),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
