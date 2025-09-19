import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messanger/allpaths.dart';
import 'package:messanger/utils/enum.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent,LoginStates>{
  final FirebaseAuthentiction firebaseAuthentiction;
  LoginBloc(this.firebaseAuthentiction):super(LoginStates()){
    on<AddUserPassword>(_addpassword);
    on<AddLoginEmail>(_addemail);
    on<LoginUserAccount>(_loginuseraccount);
    on<ResetLoginStates>(resetloginstate);
  }

  _addemail(AddLoginEmail event,Emitter<LoginStates>emit){
    emit(state.copyWith(email: event.email));
  }

  _addpassword(AddUserPassword event,Emitter<LoginStates>emit){
    emit(state.copyWith(password: event.password));
  }

  _loginuseraccount(LoginUserAccount event,Emitter<LoginStates>emit)async{
    emit(state.copyWith(loginEnum: LoginEnum.loading));
    try{

      await firebaseAuthentiction.loginuser(state.email, state.password);
      var pref= await SharedPreferences.getInstance();
      pref.setString("email", state.email);
      pref.setString("password", state.password);
      emit(state.copyWith(loginEnum: LoginEnum.success,message: "User Login Succesfully"));

    }on FirebaseAuthException catch(e){
      if(e.code == "invalid-credential"){
        emit(state.copyWith(loginEnum: LoginEnum.notexists,message: e.code.toString()));
      }else{
        emit(state.copyWith(loginEnum: LoginEnum.failure,message: e.code.toString()));
      }
    }
  }

  resetloginstate(ResetLoginStates event,Emitter<LoginStates>emit){
    emit(state.copyWith(email: "",password: "",loginEnum: LoginEnum.initial,message: ""));
  }
}
