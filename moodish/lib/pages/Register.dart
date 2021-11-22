import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:midterm_app/models/form_model.dart';
import 'package:midterm_app/pages/Account.dart';
//import 'package:midterm_app/pages/Home.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  FormModel profile = FormModel();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Error"),
            ),
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Create Account"),
            ),
            body: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("E-mail", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: "please enter your email"),
                            EmailValidator(
                                errorText: "Please enter corrected email."),
                          ]),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (String? email) {
                            profile.Email = email!;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Password", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "please enter your password"),
                          obscureText: true,
                          onSaved: (String? password) {
                            profile.Password = password!;
                          },
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF5F478C),
                              fixedSize: Size(250, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              textStyle: TextStyle(fontSize: 20),
                            ),
                            child: Text("Register",
                                style: TextStyle(fontSize: 20)),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                try {
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                          email: profile.Email!,
                                          password: profile.Password!)
                                      .then((value) {
                                    formKey.currentState!.reset();
                                    //Fluttertoast.showToast(
                                    //    msg: "completed",
                                    //    gravity: ToastGravity.TOP);
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Account();
                                    }));
                                  });
                                } on FirebaseAuthException catch (e) {
                                  //print(e.code);
                                  //print(e.message);
                                  //Fluttertoast.showToast(
                                  //    msg: e.message!,
                                  //    gravity: ToastGravity.CENTER);
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
