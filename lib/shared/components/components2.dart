import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget TFFButton ({
  @required TextInputType type,
  @required IconData prefixIcon,
  @required String label,
  @required TextEditingController controler,
  Function onSubmit,
  IconData suffixIcon,
  bool isPassword = false,
  Function iconButton,
@required Function validate,
})
=>  TextFormField(
keyboardType: type,
controller:  controler,
onFieldSubmitted: onSubmit,
validator: validate,
obscureText: isPassword ,
decoration: InputDecoration(
border: OutlineInputBorder(),
fillColor: Colors.white,
prefixIcon: Icon(
    prefixIcon,
  color: Colors.deepPurple,
),
labelText: label,
  suffixIcon: suffixIcon != null ? IconButton(
    icon: Icon(
        suffixIcon,
      color: Colors.deepPurple,
    ),
    onPressed: iconButton,
  ) : null
),
);

Widget Button ({
@required double width ,
@required double radius,
  @required Function pressed,
@required String text,
  Color background,
})
=>  Container(
  width: width,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: background,
  ),
  child: MaterialButton(
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    onPressed: pressed,
  ),
);
