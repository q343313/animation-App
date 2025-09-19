

part of 'updatebloc.dart';

class UpdatedStates extends Equatable{
  final String username;
  final String countrycode;
  final String phone;
  final String image;
  UpdatedStates({
    this.phone = "",
    this.image= "",
    this.countrycode = "",
    this.username = ""
});
  UpdatedStates copyWith({
    String?username,
     String? countrycode,
     String ?phone,
     String ?image
}){
    return UpdatedStates(
      username: username??this.username,
      countrycode: countrycode??this.countrycode,
      phone: phone??this.phone,
      image: image??this.image
    );
  }
  @override
  List<Object>get props => [username,countrycode,phone,image];
}