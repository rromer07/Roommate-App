import 'package:flutter/material.dart';
import 'package:roommate_app/pages/home_page.dart';
import 'package:roommate_app/utils/constants.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/login";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey, 
            child:Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                    controller: _usernameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Enter email", 
                      labelText: "Username",
                    )
                  ),
                  SizedBox(
                    height: 20,

                  ),
                  TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter password", 
                      labelText: "Password",
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: RaisedButton(
                      onPressed: (){
                        Constants.prefs.setBool("loggedIn", true);
                        // Navigator.push(context, 
                        // MaterialPageRoute(
                        //   builder: (context)=>HomePage()));
                        Navigator.pushReplacementNamed(
                          context, HomePage.routeName);
                      },
                      child:Text("Sign In"),
                      color: Colors.orange,
                      textColor: Colors.white,
                    ),
                  )
                 ],
                ),
              ),
            )
          )
        ),
      )
      
    );
  }
}