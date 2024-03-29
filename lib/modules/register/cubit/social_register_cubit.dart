

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysocial283/models/login_model.dart';
import 'package:mysocial283/modules/register/cubit/social_register_state.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  ///SocialRegisterCubit(SocialRegisterStates x) : super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  void changeIconVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SocialRegisterIconVisibility());
  }

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(SocialRegisterLodingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
          userCreate(
              email: email,
              password: password,
              name: name,
              phone: phone,
              uId: value.user!.uid,
          );
      print(value.credential);
      print(value.user?.email);

      // emit(SocialRegisterSuccessState());
    }).catchError((onError) {
      emit(SocialRegisterErrorState());
    });
  }

  void userCreate({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String uId,
  }) {
    SocialUserModel socialUserModel = SocialUserModel(
      name: name,
      email: email,
      password: password,
      phone: phone,
      uId: uId,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(socialUserModel.toMap())
        .then((value) {
      emit(SocialCreateUserSuccessState());
    }).catchError((error) {
      emit(SocialCreateUserErrorState());
    });
  }
}
