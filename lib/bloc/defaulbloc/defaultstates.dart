




part of'defaultboc.dart';

class DefaultStates extends Equatable{
  final bool showpassword;
  final bool checkbox;
  DefaultStates({this.showpassword = false,this.checkbox = false});
  DefaultStates copyWith({bool?showpassword,bool?checkbox}){
    return DefaultStates(
      showpassword: showpassword??this.showpassword,
      checkbox: checkbox??this.checkbox
    );
  }
  @override
  List<Object>get props => [showpassword,checkbox];
}