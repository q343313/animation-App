

part of'updatebloc.dart';

abstract class UpdateEvent extends Equatable{
  @override
  List<Object>get props => [];
}

class AddUpdatedUsername extends UpdateEvent{
  final String username;
  AddUpdatedUsername({required this.username});
  @override
  List<Object>get props => [username];
}

class AddUpdatedCountrycode extends UpdateEvent{
  final String countrycode;
  AddUpdatedCountrycode({required this.countrycode});
  @override
  List<Object>get props => [countrycode];
}

class AddUserImages extends UpdateEvent{
  final String image;
  AddUserImages({required this.image});
  @override
  List<Object>get props => [image];
}

class AddUserPhoneNumber extends UpdateEvent{
  final String phone;
  AddUserPhoneNumber({required this.phone});
  @override
  List<Object>get props => [phone];
}

class UpdatedUserAccount extends UpdateEvent{}
class ResetUpdatedState extends UpdateEvent{}