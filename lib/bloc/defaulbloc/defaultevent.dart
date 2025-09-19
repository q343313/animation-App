



part of'defaultboc.dart';

abstract class DefaultEvent extends Equatable{
  @override
  List<Object>get props => [];
}

class ShowPassword extends DefaultEvent{}

class OnCheckbox extends DefaultEvent{}
class OffCheckBox extends DefaultEvent{}