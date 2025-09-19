


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'defaultevent.dart';
part 'defaultstates.dart';


class DefaultBloc extends Bloc<DefaultEvent,DefaultStates>{
  DefaultBloc():super(DefaultStates()){
    on<ShowPassword>(_showpassword);
    on<OffCheckBox>(_hidecheckbix);
    on<OnCheckbox>(_showpacheck);
  }

  _showpassword(ShowPassword event,Emitter<DefaultStates>emit){
    emit(state.copyWith(showpassword: !state.showpassword));
  }

  _showpacheck(OnCheckbox event,Emitter<DefaultStates>emit){
    emit(state.copyWith(checkbox:!state.checkbox));
  }

  _hidecheckbix(OffCheckBox event,Emitter<DefaultStates>emit){
    emit(state.copyWith(checkbox: false));
  }

}