import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/modules/test/register.dart';
import 'package:untitled1/shared/components/components2.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var thisKey = GlobalKey<FormState>();
  bool isPasswordAppear = true;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: thisKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    width: 200,
                      height: 200,
                      image:NetworkImage(
                        'https://relibion.in/images/Logo/signup-page.png'
                      ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Welcome back!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Log in to your existant account of Q Allure',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                 SizedBox(
                   height: 35,
                 ),
                  TFFButton(
                    controler: emailController,
                    type: TextInputType.emailAddress,
                    prefixIcon: Icons.email,
                    label: 'email address',
                    onSubmit: (value){
                      print(emailController);
                    },
                      validate: ( String value){
                        if(value.isEmpty){
                          return ' email must be not empty';
                        }
                        return null;
                      }

                  ) ,
                  SizedBox(
                    height: 20,
                  ),
                  TFFButton(
                      controler: passwordController,
                      type: TextInputType.visiblePassword,
                      prefixIcon: Icons.lock,
                      label: 'Password',
                      isPassword: isPasswordAppear,
                      suffixIcon: isPasswordAppear ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                      iconButton: (){
                        setState(() {
                          isPasswordAppear = !isPasswordAppear;
                        });
                      },
                      onSubmit: (value){
                        print(passwordController);
                      },
                      validate: ( String value){
                        if(value.isEmpty){
                          return ' password must be not empty';
                        }
                        return null;
                      }

                  ) ,
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forget Password?',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Button(
                    text: 'LOG IN ',
                    width: 200,
                    radius: 30,
                    background: Colors.deepPurple,
                    pressed: (){
                      if (thisKey.currentState.validate()){
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    }
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Or connect using',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 150,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(15),
                         color: Colors.blue[900],
                       ),
                       child: TextButton.icon(
                         onPressed: (){},
                         icon: Icon(
                           Icons.add_link,
                           color: Colors.white,
                         ),
                         label:Text(
                           'Facebook',
                           style: TextStyle(
                             color: Colors.white,
                           ),
                         ),
                       ),
                     ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.red,
                        ),
                        child: TextButton.icon(
                          onPressed: (){},
                          icon: Icon(
                            Icons.alternate_email_outlined,
                            color: Colors.white,
                          ),
                          label:Text(
                            'Google',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        child: Text(
                          'Sign Up',
                        ),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Register() ,
                            ),
                          );
                        },
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
