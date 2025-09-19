part of 'login_bloc.dart';

class LoginStates extends Equatable{
  final String email;
  final String password;
  final LoginEnum loginEnum;
  final String message;
  const LoginStates({this.loginEnum = LoginEnum.initial,this.password ="",this.email = "",this.message = ""});

  LoginStates copyWith({
    String?email,
     String?password,
     LoginEnum?loginEnum,
     String?message,
}){
   return LoginStates(
     email:  email??this.email,
     password: password??this.password,
     loginEnum: loginEnum??this.loginEnum,
     message: message??this.message
   ) ;
}
  @override
  List<Object>get props => [email,password,loginEnum,message];
}