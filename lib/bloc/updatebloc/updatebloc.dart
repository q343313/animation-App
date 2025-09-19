

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'updateevent.dart';
part 'updatestates.dart';


class UpdatedBloc extends Bloc<UpdateEvent,UpdatedStates>{
  UpdatedBloc():super(UpdatedStates()){
    on<AddUserPhoneNumber>(_addphone);
    on<AddUpdatedCountrycode>(_addcountry);
    on<AddUpdatedUsername>(_addusername);
    on<AddUserImages>(_addimages);
    on<UpdatedUserAccount>(_updateduseraccount);
  }

  _addimages(AddUserImages event,Emitter<UpdatedStates>emit)async{
    var pref = await SharedPreferences.getInstance();
    pref.setString("image", event.image);
    emit(state.copyWith(image: event.image));
  }

  _addusername(AddUpdatedUsername event,Emitter<UpdatedStates>emit){
    emit(state.copyWith(username: event.username));
  }

  _addcountry(AddUpdatedCountrycode event,Emitter<UpdatedStates>emit){
    emit(state.copyWith(countrycode: event.countrycode));
  }

  _addphone(AddUserPhoneNumber event,Emitter<UpdatedStates>emit){
    emit(state.copyWith(phone: event.phone));
  }

  _updateduseraccount(UpdatedUserAccount event,Emitter<UpdatedStates>emit)async{

    var pref = await SharedPreferences.getInstance();
    final username = pref.getString("username").toString();
    final countrydoe   = pref.getString("countrycode").toString();
    final phone = pref.getString("phone").toString();

    final updateusername = state.username == null || state.username.isEmpty?username:state.username;
    final updatecountrycode = state.countrycode == null || state.countrycode.isEmpty?countrydoe:state.countrycode;
    final updatephone = state.phone == null || state.phone.isEmpty?phone:state.phone;

    pref.setString("username", updateusername);
    pref.setString("countrycode", updatecountrycode);
    pref.setString("phone", updatephone);
    emit(state.copyWith(username: "",image: "",countrycode: "",phone: ""));

  }


}