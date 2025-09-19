part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable{
  @override
  List<Object>get props => [];
}
class AddLoginEmail extends LoginEvent{
  final String email;
  AddLoginEmail({required this.email});

  @override
  // TODO: implement props
  List<Object> get props => [email];
}

class AddUserPassword extends LoginEvent{
  final String password;
  AddUserPassword({required this.password});
  @override
  List<Object>get props=> [password];
}

class LoginUserAccount extends LoginEvent{}

class ResetLoginStates extends LoginEvent{}