import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_flutter/models/user/user_model.dart';

class UsersScreen extends StatelessWidget {
   List<UserModel> users = [
     UserModel(
         id: 1,
         name: 'Mohammad Albaba',
         phone: '+972 595335637',
     ),
     UserModel(
       id: 2,
       name: 'Ibrahim Albaba',
       phone: '+972 595657112',
     ),
     UserModel(
       id: 3,
       name: 'Aneas Albaba',
       phone: '+972 595828939',
     ),
     UserModel(
       id: 1,
       name: 'Mohammad Albaba',
       phone: '+972 595335637',
     ),
     UserModel(
       id: 2,
       name: 'Ibrahim Albaba',
       phone: '+972 595657112',
     ),
     UserModel(
       id: 3,
       name: 'Aneas Albaba',
       phone: '+972 595828939',
     ),
     UserModel(
       id: 1,
       name: 'Mohammad Albaba',
       phone: '+972 595335637',
     ),
     UserModel(
       id: 2,
       name: 'Ibrahim Albaba',
       phone: '+972 595657112',
     ),
     UserModel(
       id: 3,
       name: 'Aneas Albaba',
       phone: '+972 595828939',
     ),
     UserModel(
       id: 1,
       name: 'Mohammad Albaba',
       phone: '+972 595335637',
     ),
     UserModel(
       id: 2,
       name: 'Ibrahim Albaba',
       phone: '+972 595657112',
     ),
     UserModel(
       id: 3,
       name: 'Aneas Albaba',
       phone: '+972 595828939',
     ),
   ];
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => buildUserItem(users[index]),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20.0,
          ),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        itemCount: users.length,
      ),
    );
  }

  Widget buildUserItem(UserModel user) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          child: Text(
            '${user.id}',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user.name}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${user.phone}',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );

// 1. build item
// 2. build list
// 3. add item to list
}
