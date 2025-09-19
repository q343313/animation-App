


import 'package:image_picker/image_picker.dart';

class ImageRepository{

  final _picker = ImagePicker();

  Future<XFile?>galleryimage()async{
    XFile? imagepath = await _picker.pickImage(source: ImageSource.gallery,imageQuality: 80);
    return imagepath;
  }

  Future<XFile?>cameraimage()async{
    XFile? imagepath = await _picker.pickImage(source: ImageSource.camera,imageQuality: 80);
    return imagepath;
  }

}