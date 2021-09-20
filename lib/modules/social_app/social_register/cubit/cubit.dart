import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/models/shop_app/login_model.dart';
import 'package:udemy_flutter/models/social_app/social_user_model.dart';
import 'package:udemy_flutter/modules/shop_app/login/cubit/states.dart';
import 'package:udemy_flutter/modules/shop_app/register/cubit/states.dart';
import 'package:udemy_flutter/modules/social_app/social_register/cubit/states.dart';
import 'package:udemy_flutter/shared/network/end_points.dart';
import 'package:udemy_flutter/shared/network/remote/dio_helper.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates>
{
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);


  void userRegister({
    @required String name,
    @required String email,
    @required String password,
    @required String phone,
})
  {
       emit(SocialRegisterLoadingState());
       FirebaseAuth.instance
       .createUserWithEmailAndPassword(
           email: email, 
           password: password,
       ).then((value){
         userCreate(
             uId: value.user.uid,
             name: name,
             email: email,
             phone: phone,
             );
         print(value.user.email);
         print(value.user.uid);
       }).catchError((error){
         emit(SocialRegisterErrorState(error.toString()));
       });
  }

  void userCreate({
    @required String name,
    @required String email,
    @required String phone,
    @required String uId,
}){
    SocialUserModel model = SocialUserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      bio: 'write you bio ...',
      cover: 'https://image.freepik.com/free-photo/fish-pattern-herring-fish-old-blue-wooden-background_73966-1460.jpg',
      image: 'https://image.freepik.com/free-photo/handsome-teen-boy-with-hand-head-looking-up-shirt-hoodie-looking-thoughtful-front-view_176474-106539.jpg',
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value){
          emit(SocialCreateUserSuccessState());
    })
        .catchError((error){
      emit(SocialCreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SocialRegisterChangePasswordVisibilityState());
  }
}
