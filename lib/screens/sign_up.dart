import 'package:flutter/material.dart';
import 'package:welcome_screen/core/usecases/auth_use_case.dart';
import 'package:welcome_screen/data/repositories/auth_repository_impl.dart';
import 'package:welcome_screen/domain/entity/role_entity.dart';
import 'package:welcome_screen/domain/usecase/auth.dart';

class SignUp extends StatelessWidget {

  TextEditingController login = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController middlename = TextEditingController();
  TextEditingController password = TextEditingController();

  AuthUseCase auth = Auth(AuthRepositoryImpl());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/register.png'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 35, right: 35),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: 190, top: 40),
                    child: Text("Create\nAccount",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 70,),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: surname,
                            validator: (value) {
                              if (value == null || value.isEmpty) return "Fill in the field!";
                              return null;
                            },
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey[600]!)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                prefixIcon: Icon(Icons.person_outlined, color: Colors.white),
                                hintText: "Surname",
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: name,
                            validator: (value) {
                              if (value == null || value.isEmpty) return "Fill in the field!";
                              return null;
                            },
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey[600]!)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                prefixIcon: Icon(Icons.person_outlined, color: Colors.white),
                                hintText: "Name",
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: middlename,
                            validator: (value) {
                              if (value == null || value.isEmpty) return "Fill in the field!";
                              return null;
                            },
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey[600]!)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                prefixIcon: Icon(Icons.person_outlined, color: Colors.white),
                                hintText: "Middle Name",
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: login,
                            validator: (value) {
                              if (value == null || value.isEmpty) return "Fill in the field!";
                              return null;
                            },
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey[600]!)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                prefixIcon: Icon(Icons.email_outlined, color: Colors.white),
                                hintText: "Email",
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: password,
                            validator: (value) {
                              if (value == null || value.isEmpty) return "Fill in the field!";
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey[600]!)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(43, 191, 228, .9),
                          Color.fromRGBO(79, 85, 98, 5),
                        ],
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        var error = await auth.signUp(RegistrationParams(RoleEnum.user, surname.text, name.text, middlename.text, login.text, password.text));
                        if (error != null)
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
                        else
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successful registration!")));
                      },
                      child: Center(
                        child: Text(
                          "Sign Up",
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
