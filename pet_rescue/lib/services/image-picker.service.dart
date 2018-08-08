import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {

  static Future<File> pickImageFromCamera() async => ImagePicker.pickImage(source: ImageSource.camera);
  static Future<File> pickImageFromGallery() async => ImagePicker.pickImage(source: ImageSource.gallery);
}
