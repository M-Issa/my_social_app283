


abstract class SocialRegisterStates {}

class SocialRegisterInitialState extends SocialRegisterStates{}
class SocialRegisterIconVisibility extends SocialRegisterStates{}




class SocialRegisterLodingState extends SocialRegisterStates{}
class SocialRegisterSuccessState extends SocialRegisterStates {}
class SocialRegisterErrorState extends SocialRegisterStates{
  // final String error;
  // SocialRegisterErrorState(this.error);
}

class SocialCreateUserSuccessState extends SocialRegisterStates {}
class SocialCreateUserErrorState extends SocialRegisterStates{
  // final String error;
  // SocialRegisterErrorState(this.error);
}


