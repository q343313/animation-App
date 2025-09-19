

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:messanger/repository/imagerepository.dart';

part 'imageevent.dart';
part 'imagestates.dart';

class ImageBloc extends Bloc<ImageEvent,ImageStates>{
  final ImageRepository imageRepository;
  ImageBloc(this.imageRepository):super(ImageStates()){
    on<GalleryCapture>(_galleryimage);
    on<CameraCapture>(_cameraimage);
    on<DeleteImage>(_deleteimage);
  }

  _galleryimage(GalleryCapture event,Emitter<ImageStates>emit)async{
    final image = await imageRepository.galleryimage();
    emit(state.copyWith(imagepath: image));
  }

  _cameraimage(CameraCapture event,Emitter<ImageStates>emit)async{
    final image = await imageRepository.cameraimage();
    emit(state.copyWith(imagepath: image));
  }

  _deleteimage(DeleteImage event,Emitter<ImageStates>emit){
    emit(state.copyWith(imagepath: null));
  }
}