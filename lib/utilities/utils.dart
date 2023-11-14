import 'package:image_picker/image_picker.dart';

imagePicker(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? imageFile = await imagePicker.pickImage(source: source);

  if(imageFile != null) {
    return await imageFile.readAsBytes();
  }
}