
import 'dart:io';

import 'package:messanger/bloc/imagebloc/imagebloc.dart';

import '../../allpaths.dart';

class CustomImageWidget extends StatelessWidget {
  final String image;
  const CustomImageWidget({super.key,this.image = ""});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 70,
          backgroundColor: Colors.black12,
          backgroundImage: image != null && image.isNotEmpty?FileImage(File(image)):null,
          child: image == null || image.isEmpty?
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt),
                    Text("Upload image",style: TextStyle(fontFamily: "body_p",fontSize: 17),)
                  ],
                ),
              ):null,
        ),
        Positioned(
          bottom: 0,
            right: 0,
            child: CircleAvatar(
          backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.scaffoldlightmode
          : AppColors.scaffolddarkmode,
          child: Icon(Icons.camera_alt,color:  Theme.of(context).brightness == Brightness.dark
              ? AppColors.scaffolddarkmode
              : AppColors.scaffoldlightmode,),
        ))
      ],
    );
  }
}


Future<void>imagepickerwidget(BuildContext context){
  return showModalBottomSheet(context: context,
      builder: (context){
    return Container(
      width: double.infinity,
      height: 179,
      child: Column(
        children: [
          customlisttile(context, (){
            Navigator.pop(context);
            context.read<ImageBloc>().add(GalleryCapture());
          }, "Gallery", Icon(Icons.library_add)),
          customlisttile(context, (){
            Navigator.pop(context);
            context.read<ImageBloc>().add(CameraCapture());
          }, "Camera", Icon(Icons.camera)),
          customlisttile(context, (){
            Navigator.pop(context);
            context.read<ImageBloc>().add(DeleteImage());
          }, "Delete", Icon(Icons.delete,color: Colors.red,)),
        ],
      ),
    );
      });
}

Widget customlisttile(BuildContext context,VoidCallback callback,String title,Icon icon){
  return ListTile(
    title: AutoSizeText(title,style: TextStyle(fontFamily: "heading_c",fontSize: 17),),
    leading: icon,
    onTap: callback,
  );
}