import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:messanger/config/components/customsnackbarwidget.dart';
import 'package:messanger/main.dart';
import 'package:messanger/utils/enum.dart';
import '../../allpaths.dart';

class Loginscreens extends StatefulWidget {
  const Loginscreens({super.key});

  @override
  State<Loginscreens> createState() => _LoginscreensState();
}

class _LoginscreensState extends State<Loginscreens> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  late final LoginBloc loginBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginBloc = LoginBloc(getIt());
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => loginBloc,
  child: Scaffold(
      body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 38.0),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                     SizedBox(height: 220,),
                     Customheadingwidget(text: "Welcome back", heading: "Login",),
                     SizedBox(height: 30,),
                     buildemail(emailcontroller, context),
                     SizedBox(height: 10,),
                  passwordwidget(passwordcontroller, context),
                  resetpasswordwidget(context),
                     SizedBox(height: 40,),
                     LoginActionButton(
                         formkey: formkey,
                         passwordcontroller: passwordcontroller,
                         emailcontroller: emailcontroller),
                     SizedBox(height: 20,),
                     CustomAuthButton(callback: (){Navigator.pushReplacementNamed(context, RouteNames.signupscreens);},text: "Don't have account?",buttonname: "Signup",).animate().fade(duration: 1300.ms).scale(delay: 1500.ms),
                   ],
                 ),
            ),
          )

        ).animate().fade(duration: 500.ms).scale(delay: 500.ms),

    ),
);
  }
}


class LoginActionButton extends StatelessWidget {
  const LoginActionButton({super.key,required this.formkey,required this.passwordcontroller,required this.emailcontroller});
  final GlobalKey<FormState>formkey;
  final TextEditingController emailcontroller;
  final TextEditingController passwordcontroller;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc,LoginStates>(listener: (context,state){
      if(state.loginEnum == LoginEnum.success){
        context.read<LoginBloc>().add(ResetLoginStates());
        Navigator.pushReplacementNamed(context, RouteNames.home);
        CustonSnack.flusbarsnackbar(context: context, title: "Login Succesfully", message: state.message);
        emailcontroller.clear();
        passwordcontroller.clear();
      }else if(state.loginEnum == LoginEnum.failure){
        context.read<LoginBloc>().add(ResetLoginStates());
        CustonSnack.flusbarsnackbar(context: context, title: "Login Failed", message: state.message,color: Colors.red);
        emailcontroller.clear();
        passwordcontroller.clear();
      }else if(state.loginEnum == LoginEnum.notexists){
        context.read<LoginBloc>().add(ResetLoginStates());
        Navigator.pushReplacementNamed(context, RouteNames.signupscreens);
        CustonSnack.flusbarsnackbar(context: context, title: "Account not found", message: state.message,color: Colors.orange);
        emailcontroller.clear();
        passwordcontroller.clear();
      }
    },
    child: BlocBuilder<LoginBloc,LoginStates>(builder: (context,state){
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(onPressed: (){
          if(formkey.currentState!.validate()){
            context.read<LoginBloc>().add(LoginUserAccount());
          }
        },
            child: BlocBuilder<LoginBloc,LoginStates>(builder: (context,state){
              switch(state.loginEnum){
                case LoginEnum.loading:
                  return CupertinoActivityIndicator(color: Colors.white,);
                case LoginEnum.notexists:
                case LoginEnum.failure:
                case LoginEnum.success:
                case LoginEnum.initial:
                  return AutoSizeText("Login",style: TextStyle(color: Colors.white),).animate()
                      .fadeIn() // uses `Animate.defaultDuration`
                      .scale() // inherits duration from fadeIn
                      .move(delay: 1900.ms, duration: 1500.ms).animate()
                      .fadeIn() // uses `Animate.defaultDuration`
                      .scale() // inherits duration from fadeIn
                      .move(delay: 1300.ms, duration: 1000.ms);
              }
            })),
      );
    }),);
  }
}



Widget buildemail(TextEditingController contoller,BuildContext context){
 return BlocBuilder<LoginBloc, LoginStates>(
  builder: (context, state) {
    return CustomTextfieldWidget(
   label: "Email",
   hint: "***********@gmail.**",
   preffixicon: Icons.email,
      onChanged: (value)=>context.read<LoginBloc>().add(AddLoginEmail(email: value.toString())),
      validator: (valu)=>AppVallidations.emailvalidation(valu.toString()),
 );
  },
);
}

Widget passwordwidget(TextEditingController contoller,BuildContext context){
  return BlocBuilder<LoginBloc, LoginStates>(
  builder: (context, statess) {
    return BlocBuilder<DefaultBloc, DefaultStates>(
    builder: (context, state) {
      return CustomTextfieldWidget(label: "Password",
        hint: "Password",
        validator: (value)=>AppVallidations.passwordvalidations(value.toString()),
        onChanged: (value)=>context.read<LoginBloc>().add(AddUserPassword(password: value)),
        obstracttext: state.showpassword,
        preffixicon: Icons.lock,
        suffixicon: IconButton(
            onPressed: (){
              context.read<DefaultBloc>().add(ShowPassword());
            },
            icon: Icon(state.showpassword?Icons.visibility_off:Icons.visibility)),);
    },
  );
  },
);
}

Widget resetpasswordwidget(BuildContext context,){
  return Align(
    alignment: Alignment.topRight,
    child: TextButton(onPressed: (){
      Navigator.pushNamed(context, RouteNames.reset);
    }, child: AutoSizeText(
      "forget password ?",maxFontSize:32,
      minFontSize : 25,
      style: TextStyle(
          fontSize:Get.width * 0.025,
          fontFamily: "body_p",
          color: Colors.blue
      ),)),
  );
}
