

abstract class SocialLoginStates {}

class SocialLoginInitialState extends SocialLoginStates{}
class SocialLoginIconVisibility extends SocialLoginStates{}




class SocialLoginLodingState extends SocialLoginStates{}
class SocialLoginSuccessState extends SocialLoginStates {}
class SocialLoginErrorState extends SocialLoginStates{
  final String error;
  SocialLoginErrorState(this.error);
}


