import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tehnikpompa/app/modules/createservice/controllers/createservice_controller.dart';
import 'package:tehnikpompa/utils/constant.dart';

CreateserviceController servisC = CreateserviceController();

class buildServisWidget extends StatelessWidget {
  
  final TextEditingController? textField;
  final String? labelText;
  final String? promptText;
  final String? promptText2;
  final String? promptText3;
  final String? hintText;
  final int? nomor;

  const buildServisWidget(
      {this.textField,
      this.labelText,
      this.hintText,
      this.promptText,
      this.promptText2,
      this.promptText3,
      this.nomor = 0,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      controller: textField,
      keyboardType: nomor == 0
          ? TextInputType.text
          : nomor == 1
              ? TextInputType.number
              : TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Constants.blacktextStyle,
          labelText: labelText,
          labelStyle: Constants.blacktextStyle,
          border: OutlineInputBorder()),
      validator: (value) {
        if (nomor == 0) {
          if (value!.isEmpty) {
            return '$labelText';
          }
        } else if (nomor == 1) {
          if (value!.isEmpty) {
            return '$promptText';
          } else if (!value.isNum) {
            return '$promptText2';
          } else if (value.length < 10) {
            return '$promptText3';
          }
        } else {
          if (value!.isEmpty) {
            return '$promptText';
          } else if (!value.isEmail) {
            return '$promptText2';
          }
        }
      },
      onSaved: (value) {
        textField?.text = value!;
      },
    );
  }
}

class widgetGallery extends StatelessWidget{

  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;

  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}
