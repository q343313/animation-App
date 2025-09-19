import 'package:get/get.dart';
import '../../allpaths.dart';

class Signupscreens extends StatefulWidget {
  const Signupscreens({super.key});
  @override
  State<Signupscreens> createState() => _SignupscreensState();
}
class _SignupscreensState extends State<Signupscreens> {
  final SignupController signupController = Get.put(SignupController());
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 38.0),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                SizedBox(height: 100,),
                  Customheadingwidget(text: "Create new Account", heading: "Signup",),
                  SizedBox(height: 30,),
                  buildusernameefield(signupController.usernamecontroller.value),
                  SizedBox(height: 10,),
                  buildemailfield(signupController.emailcontroller.value),
                  SizedBox(height: 10,),
                 buildpaswordfield(signupController.passwordcontroller.value),
                  SizedBox(height: 10,),
                  builddoffield(signupController,context),
                  SizedBox(height: 10,),
                  buildphonefield(signupController.phonecontroller.value,signupController,context),
                  buildcheckboxwidget(context),
                  SizedBox(height: 40,),
                  SignupActionButton(signupController: signupController,formkey: formkey,).animate().fade(duration: 900.ms).scale(delay: 1100.ms),
                  SizedBox(height: 20,),
                  CustomAuthButton(callback: (){Navigator.pushNamed(context, RouteNames.login);},text: "Already have account?",buttonname: "Login",).animate().fade(duration: 1300.ms).scale(delay: 1500.ms),
                ],
              ),
          ),
        ).animate().fade(duration: 500.ms).scale(delay: 500.ms),
      ),
    );
  }
}







