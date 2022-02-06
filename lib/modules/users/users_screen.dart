import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/models/users/user_model.dart';

class UsersScreen extends StatelessWidget {
  List<UserModel> users =[
    UserModel(
      id: 1,
      name: 'Menna Adel',
      phone: '+275360127 ',
    ),
    UserModel(
      id: 2,
      name: 'Rodina Adel',
      phone: '+2753350127 ',
    ),
    UserModel(
      id: 3,
      name: 'Tasnim Adel',
      phone: '+2753353827 ',
    ),
    UserModel(
      id: 1,
      name: 'Menna Adel',
      phone: '+275360127 ',
    ),
    UserModel(
      id: 2,
      name: 'Rodina Adel',
      phone: '+2753350127 ',
    ),
    UserModel(
      id: 3,
      name: 'Tasnim Adel',
      phone: '+2753353827 ',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index)=>  bulidUserItem(users[index]),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20,
              end: 20,
            ),
            child: Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
          ),
          itemCount:users.length,
      ),
    );
  }

  Widget bulidUserItem(UserModel users) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25,
          child: Text(
            '${users.id}',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${users.name}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${users.phone}',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),


          ],
        ),
      ],
    ),
  );


}
