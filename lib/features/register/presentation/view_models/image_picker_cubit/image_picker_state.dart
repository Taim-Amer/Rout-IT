part of 'image_picker_cubit.dart';


abstract class ImagePickerState {}

class ImagePickerInitial extends ImagePickerState {}

class ImagePickerSuccess extends ImagePickerState {
  final File image;
  ImagePickerSuccess(this.image);
}
class ImagePickerFailure extends ImagePickerState{}
