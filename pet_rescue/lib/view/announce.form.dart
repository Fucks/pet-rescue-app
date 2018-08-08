import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import '../services/image-picker.service.dart';
import '../widgets/loading.dart';

class AnnounceForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnnounceFormState();
}

class AnnounceFormState extends State<AnnounceForm> {
  File _image = null;

  bool isLoadingImage = false;

  TextEditingController _addressController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();

  void _saveForm() => print('mandou');

  void _addImage() async {
    setState(() => isLoadingImage = true);
    var image = await ImagePickerService.pickImageFromCamera();

    setState(() {
      _image = image;
      isLoadingImage = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);

    IconButton _closeButton = IconButton(
        icon: new Icon(Icons.close),
        color: Colors.white,
        onPressed: () => Navigator.of(context).pop());

    var _addPhotoButton = FloatingActionButton(
        heroTag: 'add-button',
        onPressed: _addImage,
        child: Icon(Icons.add_a_photo));

    var _imageContainer;

    if (isLoadingImage) {
      _imageContainer = Loading();
    } else if (_image != null) {
      _imageContainer = Container(
        foregroundDecoration: BoxDecoration(
            image:
                DecorationImage(image: FileImage(_image), fit: BoxFit.cover)),
        height: size.height / 2,
        width: size.width,
      );
    } else {
      _imageContainer = Container(
        decoration: BoxDecoration(color: Colors.deepOrange),
        height: size.height / 2,
        width: size.width,
        child: Icon(Icons.photo, color: Colors.white),
      );
    }

    Stack _imageSession = Stack(
      alignment: AlignmentDirectional.topEnd,
      children: <Widget>[
        _imageContainer,
        Positioned(
          right: 16.0,
          top: 16.0,
          child: _closeButton,
        ),
        Positioned(
            right: 16.0, top: (size.height / 2) - 30.0, child: _addPhotoButton)
      ],
    );

    Padding _form = Padding(
        padding: EdgeInsets.all(24.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildTextField(
                  _addressController, "Endereço", TextInputType.text),
              _buildTextField(
                  _phoneController, "Telefone", TextInputType.phone),
              _buildTextField(
                  _descriptionController, "Descrição", TextInputType.multiline),
              SizedBox(
                height: 24.0,
              ),
              RaisedButton(
                onPressed: _saveForm,
                child: Text(
                  "Cadastrar",
                  style: theme.accentTextTheme.body1,
                ),
                elevation: 5.0,
              )
            ],
          ),
        ));

    var _body = new Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: _imageSession,
          ),
          _form
        ],
      ),
    );

    return Scaffold(body: _body);
  }

  _buildTextField(
          TextEditingController ctr, String label, TextInputType type) =>
      TextFormField(
          controller: ctr,
          keyboardType: type,
          decoration: InputDecoration(labelText: label));
}
