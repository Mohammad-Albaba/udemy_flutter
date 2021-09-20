import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/social_app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/social_app/cubit/states.dart';
import 'package:udemy_flutter/modules/social_app/new_post/new_post_screen.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/styles/icon_broken.dart';

class SocialLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state)
        {
          if(state is SocialNewPostState)
            {
              navigateTo(context, NewPostScreen());
            }
        },
        builder: (context, state){
          var cubit = SocialCubit.get(context);
      return Scaffold(
        appBar: AppBar(
          title: Text(
            cubit.titles[cubit.currentIndex],
          ),
          actions: [
            IconButton(
              icon: Icon(IconBroken.Notification),
              onPressed: (){},
            ),
            IconButton(
              icon: Icon(IconBroken.Search),
              onPressed: (){},
            ),
          ],
        ),
        body: cubit.screens[cubit.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          onTap: (index){
            cubit.changeBottomNav(index);
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                    IconBroken.Home
                ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                    IconBroken.Chat,
                ),
                label: 'Chat',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                    IconBroken.Paper_Upload,
                ),
                label: 'Post',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                    IconBroken.Location,
                ),
                label: 'Users',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                    IconBroken.Setting,
                ),
                label: 'Settings'
            ),
          ],
        ),
      );
    },
    );
  }
}



/////////////////////////////////////////////////////
// return Scaffold(
// appBar: AppBar(
// title: Text(
// 'News Feed',
// ),
// ),
// body: ConditionalBuilder(
// condition: SocialCubit.get(context).model != null,
// builder:(context)
// {
// var model = SocialCubit.get(context).model;
//
// return Column(
// children: [
// if(!FirebaseAuth.instance.currentUser.emailVerified)
// Container(
// color: Colors.amber.withOpacity(.6),
// child: Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 20.0,
// ),
// child: Row(
// children: [
// Icon(
// Icons.info_outline
// ),
// SizedBox(width: 15.0,),
// Expanded(
// child: Text('Please verify your email',)),
// SizedBox(
// width: 15.0,
// ),
// defaultTextButton(
// function: (){
// FirebaseAuth.instance.currentUser.sendEmailVerification()
//     .then((value){
// showToast(
// text: 'check your email',
// state: ToastStates.SUCCESS
// );
// })
//     .catchError((error){
//
// });
// },
// text: 'send',
// ),
// ],
// ),
// ),
// ),
// ],
// );
// } ,
// fallback: (context) => Center(child: CircularProgressIndicator()),
// ),
// );