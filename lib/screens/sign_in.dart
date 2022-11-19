import 'package:flutter/material.dart';
import 'package:welcome_screen/core/usecases/auth_use_case.dart';
import 'package:welcome_screen/data/repositories/auth_repository_impl.dart';
import 'package:welcome_screen/domain/usecase/auth.dart';
import 'package:welcome_screen/screens/sign_up.dart';

class SignIn extends StatelessWidget {

  TextEditingController login = TextEditingController();
  TextEditingController password = TextEditingController();

  AuthUseCase auth = Auth(AuthRepositoryImpl());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/img_sign_in.jpeg'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 100, top: 190),
              child: Text("Sign In",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold)),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(top: 350, left: 35, right: 35),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(43, 191, 228, .3),
                            blurRadius: 20.0,
                            offset: Offset(0, 10)),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: (Colors.grey[100])!)),
                          ),
                          child: TextFormField(
                            controller: login,
                            validator: (value) {
                              if (value == null || value.isEmpty) return "Fill in the field!";
                              return null;
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.email),
                                hintText: "Email",
                                hintStyle: TextStyle(
                                    color: Colors.grey[400], fontSize: 16)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: (Colors.grey[100])!)),
                          ),
                          child: TextFormField(
                            controller: password,
                            validator: (value) {
                              if (value == null || value.isEmpty) return "Fill in the field!";
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.lock),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    color: Colors.grey[400], fontSize: 16)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 50,
                    width: 360,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(43, 191, 228, 1),
                          Color.fromRGBO(43, 191, 228, .5),
                        ],
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        var result = await auth.signIn(AuthParams(login.text, password.text));
                        result.fold(
                            (error) => { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error))) },
                            (role) => { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(role.name))) }
                        );
                      },
                      child: Center(
                        child: Text(
                          "Sign In",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 110,
                  ),
                  Row(
                    textDirection: TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Doesn't have account? ",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, .6), fontSize: 14),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color.fromRGBO(43, 191, 228, .8),
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
