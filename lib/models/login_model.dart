class SocialUserModel{
  String? name;
  String? email;
  String? password;
  String? phone;
  String? uId;

  SocialUserModel({ this.name,this.email,this.password,this.phone,this.uId});

  SocialUserModel.fromJson(Map<String,dynamic>json){
    email=json['email'];
    name=json['name'];
    password=json['password'];
    phone=json['phone'];
    uId=json['uId'];
  }

  Map<String,dynamic> toMap(){
    return{
      'name':name,
      'email':email,
      'password':password,
      'phone':phone,
      'uId':uId,
    };
  }
}