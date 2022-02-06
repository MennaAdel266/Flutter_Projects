import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.grey,
     appBar: AppBar(
       backgroundColor: Colors.black,
       leading: Icon(
         Icons.menu,
       ),
       title: Text(
         'First App',
       ),
       actions: [
         IconButton(
           icon: Icon (
             Icons.notification_important,
           ),
           onPressed: ()
           {
             print ('notification clicked');     // method
           },

         ),
         IconButton(
           icon: Icon (
             Icons.search,
           ),
           onPressed:(){
             print ('search clicked');
           },
         ),
         IconButton(
           icon: Icon(
             Icons.add_a_photo,
           ),
           onPressed: (){
             print('clicked');
           },
         ),
       ],
     ),
     body: Column(
       children:[
         Container(
           width: 200,
           child: Padding(
             padding: const EdgeInsets.all(30.0),
             child: Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20.0),
               ),
               clipBehavior: Clip.antiAliasWithSaveLayer ,
               child: Stack(
                 alignment: Alignment.bottomCenter,
                 children: [
                   Image(
                     image: NetworkImage(
                       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbrLjj6JWNb4x48LvVWLRUVKER2oCurDpSWA&usqp=CAU',

                     ),
                     height: 200,
                     width: 200,
                     fit: BoxFit.cover,
                   ),
                   Container(
                     color: Colors.black ,
                     width: double.infinity,
                     padding: EdgeInsetsDirectional.only(
                       bottom: 10,
                       top: 10,
                     ),
                     child: Text(
                       'Flower',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         fontSize: 30,
                         color: Colors.white,
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           ),
         ),
       ],
     ),
   );
  }

}