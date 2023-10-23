import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../style/button_style.dart';
import 'package:dotted_border/dotted_border.dart';

class ImagesPicker extends StatefulWidget {
  const ImagesPicker({super.key});

  @override
  State<ImagesPicker> createState() => _ImagesPickerState();
}

class _ImagesPickerState extends State<ImagesPicker> {
  File? imageFile;
  final imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          width: size.width,
          height: 210,
          child: DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(12),
              color: Colors.blueGrey,
              strokeWidth: 1,
              dashPattern: const [5, 5],
              child: SizedBox.expand(
                child: FittedBox(
                    child: imageFile != null
                        ? Image.file(File(imageFile!.path), fit: BoxFit.cover)
                        : Image.asset("assets/icon/Upload_Image_Default.png")),
              )),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
              child: ElevatedButton.icon(
                onPressed: () {
                  showPictureDialog();
                },
                label: const Text("Upload Image"),
                icon: const Icon(Icons.image),
                style: buttonPrimary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    imageFile = null;
                  });
                },
                label: const Text("Delete Image"),
                icon: const Icon(Icons.delete),
                style: buttonPrimary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> showPictureDialog() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text("Select Action"),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  getFromCamera();
                  Navigator.of(context).pop();
                },
                child: const Text("Open Camera"),
              ),
              SimpleDialogOption(
                onPressed: () {
                  getFromGallery();
                  Navigator.of(context).pop();
                },
                child: const Text("Open Gallery"),
              ),
            ],
          );
        });
  }

  getFromGallery() async {
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  getFromCamera() async {
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}
