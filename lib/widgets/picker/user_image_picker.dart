import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_app/blocs/auth/bloc/auth_bloc.dart';

import '../../models/user.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker(this.imageUrl);
  final String imageUrl;

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  String _pickedImagePath = '';
  final ImagePicker _picker = ImagePicker();

  void _pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _pickedImagePath = pickedImage.path;
        BlocProvider.of<AuthBloc>(context)
            .add(ImageChangeEvent(_pickedImagePath));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var url = _pickedImagePath == '' ? widget.imageUrl : _pickedImagePath;
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(top: 30, bottom: 15),
      child: Container(
        child: Column(
          children: [
            if (!widget.imageUrl.contains('http') || _pickedImagePath != '')
              Card(
                elevation: 0,
                child: CircleAvatar(
                    radius: 70, backgroundImage: FileImage(File(url))),
              ),
            if (widget.imageUrl.contains('http') && _pickedImagePath == '')
              Card(
                elevation: 0,
                child: CircleAvatar(
                    radius: 70, backgroundImage: NetworkImage(widget.imageUrl)),
              ),
            const SizedBox(
              height: 15,
            ),
            TextButton.icon(
                onPressed: () {
                  _pickImage();
                },
                icon: const Icon(Icons.image),
                label: const Text("Add Image"))
          ],
        ),
      ),
    );
  }
}
