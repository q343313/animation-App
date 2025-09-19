


class AppVallidations {

  static emailvalidation(String email){
    final validemail  = RegExp(r"^[^\s@]+@[^\s@]+\.[^\s@]+$");
    if(email == null || email.isEmpty){
      return "Please enter email";
    }else if(!validemail.hasMatch(email)){
      return 'please enter valid email';
    }
    return null;
  }

  static passwordvalidations(String password){
    if(password == null || password.isEmpty){
      return "Please enter password";
    }else if(password.length < 6){
      return "please password is greater than 6 digit";
    }
    return null;
  }

  static usernamevalidation(String username){
    if(username == null || username.isEmpty){
      return "Please enter username";
    }else if(username.length < 6 || username.length > 20){
      return "please username is greater than 6 digit";
    }
    return null;
  }

  static phonevalidation(String phone){
    if(phone == null || phone.isEmpty){
      return "Please enter phone number";
    }else if(phone.length  != 10 ){
      return "please phone is greater than is equal to 10 digit";
    }
    return null;
  }
}