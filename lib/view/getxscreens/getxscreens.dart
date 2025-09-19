import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messanger/bloc/imagebloc/imagebloc.dart';
import 'package:messanger/bloc/updatebloc/updatebloc.dart';
import 'package:messanger/config/components/imagewidget.dart';
import 'package:messanger/riverpad/resetproviders.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../allpaths.dart';

class Getxscreens extends ConsumerStatefulWidget {
  const Getxscreens({super.key});

  @override
  ConsumerState<Getxscreens> createState() => _GetxscreensState();
}

class _GetxscreensState extends ConsumerState<Getxscreens> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Getx"),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(future: SharedPreferences.getInstance(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (!snapshot.hasData) {
                    return Text("No Data Fount");
                  } else {
                    final data = snapshot.data!;
                    final username = data.getString("username").toString();
                    final email = data.getString("email").toString();
                    final phone = data.getString("phone").toString();
                    final countrycode = data.getString("countrycode").toString();
                    final userimage  = data.getString("image").toString();
                    final userphone = countrycode + phone;
                    return Column(
                      children: [
                        BlocListener<ImageBloc, ImageStates>(
                          listener: (context, state) {
                           if(state.imagepath != null && state.imagepath!.path.isNotEmpty){
                             context.read<UpdatedBloc>().add(AddUserImages(image: state.imagepath!.path.toString()));
                           }
                          },
                          child: BlocBuilder<ImageBloc, ImageStates>(
                            builder: (context, state) {
                              final image = state.imagepath;
                              return InkWell(
                                onTap: ()=>imagepickerwidget(context),
                                  child:image != null && image.path.isNotEmpty?
                                  CustomImageWidget(image: image.path.toString(),)
                                      :CustomImageWidget(image: userimage,));
                            },
                          ),
                        ),
                        SizedBox(height: 10,),
                        AutoSizeText(username,maxFontSize: 23,minFontSize: 20 ,style: TextStyle(
                            fontFamily: "heading_c",fontSize: width * 0.025),),
                        AutoSizeText(email,maxFontSize: 23,minFontSize: 20 ,style: TextStyle(
                            fontFamily: "body_p",fontSize: width * 0.025,color: Colors.blue),),
                        AutoSizeText(userphone,maxFontSize: 20,minFontSize: 16 ,style: TextStyle(
                            fontFamily: "body_c",fontSize: width * 0.025,color: Colors.blue),),

                        SizedBox(height: 60,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              onPressed: (){
                                ref.read(resetproviders.notifier).logoutuseraccount();
                                context.read<ImageBloc>().add(DeleteImage());
                              },
                              backgroundColor: AppColors.buttonlightmode,
                              child: Icon(Icons.logout,color: Colors.white,),),
                            FloatingActionButton(
                              onPressed: (){
                                updatedUserprofile(context, countrycode, phone, username);
                              },
                              backgroundColor: AppColors.buttonlightmode,
                            child: Icon(Icons.edit,color: Colors.white,),),
                          ],
                        )
                      ],
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}

Future updatedUserprofile(BuildContext context,String countrycode,String phone,String username){
  final width = MediaQuery.of(context).size.width;
  TextEditingController usernamecontroller = TextEditingController();
  usernamecontroller.text = username;
  TextEditingController phonecontroller= TextEditingController();
  phonecontroller.text = phone;
  return showDialog(context: context,
      builder: (context){
    return AlertDialog(
      title:Text("Updated Profile",style: TextStyle(
          fontFamily: "heading_c",fontSize: 20),),
      content: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextfieldWidget(
              label: "username",
              preffixicon: Icons.account_circle,
              controller: usernamecontroller,
              onChanged: (value)=>context.read<UpdatedBloc>().add(AddUpdatedUsername(username: value)),
              validator: (value)=>AppVallidations.usernamevalidation(value.toString()),
            ),
            SizedBox(height: 10,),
            BlocBuilder<UpdatedBloc, UpdatedStates>(
  builder: (context, state) {
    return PhoneTextField(
                controller: phonecontroller,
                countrycode: state.countrycode == null || state.countrycode.isEmpty?countrycode:state.countrycode,
                callback: (){
                  showCountryPicker(context: context, onSelect: (value){
                    context.read<UpdatedBloc>().add(AddUpdatedCountrycode(countrycode: "${value.flagEmoji} +${value.phoneCode}"));
                  });
                },
              onChanged: (value)=>context.read<UpdatedBloc>().add(AddUserPhoneNumber(phone: value)),
            );
  },
)
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("Cancel",style: TextStyle(color: Colors.blue,fontSize: 16,fontFamily: "heading_c"),)),
        TextButton(onPressed: (){
          Navigator.pop(context);
          context.read<UpdatedBloc>().add(UpdatedUserAccount());
          Navigator.pushReplacementNamed(context, RouteNames.home);
        }, child: Text("Update",style: TextStyle(color: Colors.blue,fontSize: 16,fontFamily: "heading_c"),))
      ],
    );
      });
}



