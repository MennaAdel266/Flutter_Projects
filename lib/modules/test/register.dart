import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/shared/components/components2.dart';

class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var usernameControler= TextEditingController();
  var emailControl= TextEditingController();
  var phoneControl= TextEditingController();
  var passwordControl= TextEditingController();
  var confirmControl= TextEditingController();
  var thisKeys = GlobalKey<FormState>();
  bool passwordShow = true;
  bool confirmPassword = true;
  var password = 222;
  var confirm = 222;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: thisKeys,
              child: Column(
                children: [
                  Text(
                    'Let\'s Get Started',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'Create an account to Q Allure to get all features',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TFFButton(
                    type: TextInputType.text,
                    prefixIcon: Icons.account_circle_outlined,
                    label: 'Username',
                    controler: usernameControler,
                    onSubmit: (value){
                      print(usernameControler);
                    },
                    validate: (String value){
                      if(value.isEmpty){
                        return 'you must put your name';
                      }
                    }
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TFFButton(
                      type: TextInputType.emailAddress,
                      prefixIcon: Icons.email_outlined,
                      label: 'Email',
                      controler: emailControl,
                      onSubmit: (value){
                        print(emailControl);
                      },
                      validate: (String value){
                        if(value.isEmpty){
                          return 'Email must not be empty';
                        }
                      }
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TFFButton(
                      type: TextInputType.phone,
                      prefixIcon: Icons.phone_android_outlined,
                      label: 'Phone',
                      controler: phoneControl,
                      onSubmit: (value){
                        print(phoneControl);
                      },
                      validate: (String value){
                        if(value.isEmpty){
                          return 'your number is short';
                        }
                      }
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TFFButton(
                      type: TextInputType.visiblePassword,
                      prefixIcon: Icons.lock,
                      label: 'Password',
                      controler: passwordControl,
                      isPassword: passwordShow ,
                      suffixIcon: passwordShow ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                      iconButton: (){
                        setState(() {
                          passwordShow = !passwordShow;
                        });
                      },
                      onSubmit: (value){
                        print(passwordControl);
                      },
                      validate: (String value){
                        if(value.isEmpty){
                          return 'Password must not be empty';
                        }

                      }
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TFFButton(
                      type: TextInputType.visiblePassword,
                      prefixIcon: Icons.lock_open,
                      label: 'Confirm password',
                      controler: confirmControl,
                      isPassword: confirmPassword ,
                      suffixIcon: confirmPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                      iconButton: (){
                        setState(() {
                          confirmPassword = !confirmPassword;
                        });
                      },
                      onSubmit: (value){
                        print(confirmControl);
                      },
                      validate: (String value){
                        if('$password' != '$confirm' ){
                          return 'Password is not match';
                        }

                      }
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Button(
                      text: 'Create ',
                      width: 200,
                      radius: 30,
                      background: Colors.deepPurple,
                      pressed: (){
                        if (thisKeys.currentState.validate()) {
                          print(usernameControler.text);
                          print(emailControl.text);
                          print(phoneControl.text);
                          print(passwordControl.text);
                          print(confirmControl.text);
                        }
                      }
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        child: Text(
                          'Login here',
                        ),
                        onPressed: (){},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
