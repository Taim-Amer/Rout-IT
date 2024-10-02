import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:route_it27/core/utils/local_storage/cache_services.dart';

part 'image_picker_state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  ImagePickerCubit() : super(ImagePickerInitial());
  static ImagePickerCubit get(context) => BlocProvider.of(context);

  final ImagePicker _picker = ImagePicker();
  Future<void> pickImage() async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        await CacheServices.saveData(key: "ProfileImg", value: pickedFile.path);
        emit(ImagePickerSuccess(File(pickedFile.path)));
      } else {
        // ignore: avoid_print
        print('No image selected.');
        emit(ImagePickerFailure());
      }
    } catch (e) {
      // ignore: avoid_print
      print('Failed to pick image: $e');
      emit(ImagePickerFailure());
    }
  }
}
