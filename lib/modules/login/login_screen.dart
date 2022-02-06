import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/shared/components/components.dart';

class LoginScreen extends StatefulWidget{

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailAddress = TextEditingController();
  var Password =TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPasswordShow = true;

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.white,
       appBar: AppBar(
         backgroundColor: Colors.white,
         elevation: 0,
         titleSpacing: 20,

       ),
       body: Padding(
         padding: const EdgeInsets.all(20.0),
         child: Center(
           child: SingleChildScrollView(
             child: Form(
               key: formKey,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Text(
                     'Welcome back!',
                     style: TextStyle(
                       color: Colors.black,
                       fontSize: 30,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   SizedBox(
                     height: 40,
                   ),
                   defaultFormFeild(
                     controller: emailAddress,
                     label: 'email address',
                     prefix: Icons.email_outlined,
                     type: TextInputType.emailAddress,
                     validate: ( String value){
                       if(value.isEmpty){
                         return ' email must be not empty';
                       }
                       return null;
                     }
                   ),
                   SizedBox(
                     height: 25,
                   ),
                   defaultFormFeild(
                       controller: Password,
                       label: 'password',
                       prefix: Icons.lock,
                       type: TextInputType.emailAddress,
                       isPassword: isPasswordShow,
                       suffix: isPasswordShow ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                       iconButton: (){
                         setState(() {
                           isPasswordShow = ! isPasswordShow;
                         });
                       },
                       validate: ( String value){
                         if(value.isEmpty){
                           return ' password must be not empty';
                         }
                         return null;
                       }

                   ),
                   SizedBox(
                     height: 25,
                   ),
                   defaultButton(
                     text: 'login',
                     function: ()
                     {
                       if(formKey.currentState.validate()){
                         print(emailAddress.text);
                         print(Password.text);
                       }
                     },

                   ),
                   SizedBox(
                     height: 25,
                   ),
                   defaultButton(
                     text: 'login',
                     function: ()
                     {
                       print(emailAddress.text);
                       print(Password.text);
                     },
                     isUpperCase: false,
                   ),
                   SizedBox(
                     height: 20,
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
                       SizedBox(
                         width: 5,
                       ),
                       TextButton(
                       child: Text(
                         'Sign Up',
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