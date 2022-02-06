import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 20,
        title: Row(
          children:[
            CircleAvatar(
              radius: 25,
                backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVj8rtqb78E_8kdlslt75o8UiUA5winbln9Q&usqp=CAU'
                ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
               'Chats',
                style: TextStyle(
                color: Colors.black,

            ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.camera_alt,
                size: 18,
                color: Colors.white,

              ),
            ),
            onPressed: (){

            },
          ),
          IconButton(
            icon: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.edit,
                size: 18,
                color: Colors.white,

              ),
            ),
            onPressed: (){

            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[300],
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Search',
                    ),
                  ],
                ),

              ),
              SizedBox(
                height: 10,
              ),
             Container(
               height: 100,
               child: ListView.separated(
                 scrollDirection: Axis.horizontal,
                 itemBuilder: (context, index) => buildStoryItem(),
                 separatorBuilder: (context, index) => SizedBox(
                   width: 20,
                 ),
                 itemCount: 10,
               ),
             ),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemBuilder:(context, index) => buildChatItem(),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 20,
                  ),
                  itemCount: 15,
              ),
            ],
          ),
        ),
      ),
    );

  }

  //arrow function
  Widget buildChatItem() => Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVj8rtqb78E_8kdlslt75o8UiUA5winbln9Q&usqp=CAU'
            ),
          ),
          CircleAvatar(
            radius: 8,
            backgroundColor: Colors.white,
          ),
          CircleAvatar(
            radius: 7.5,
            backgroundColor: Colors.green,
          ),

        ],
      ),
      SizedBox(
        width: 20,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sohila Ibrahim',
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  'Hello,How are you!!',

                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Text(
                  '10:20',
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );

  Widget buildStoryItem() =>  Container(
    width:60 ,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVj8rtqb78E_8kdlslt75o8UiUA5winbln9Q&usqp=CAU'
              ),
            ),
            CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
            ),
            CircleAvatar(
              radius: 7.5,
              backgroundColor: Colors.green,
            ),

          ],
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          'Menna Allah Adel',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

      ],
    ),
  );
}