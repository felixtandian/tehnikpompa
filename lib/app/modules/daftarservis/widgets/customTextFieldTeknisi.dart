import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tehnikpompa/utils/constant.dart';

class CustomTextFieldTeknisi extends StatelessWidget {
  /// NOTE: if you update this field, please update AutoComplete on edit_management_page also

  final TextEditingController? controller;
  final Function()? onTap;
  final Function(String)? onSubmit;
  final Function(String)? action;
  final String? label;
  final String? hint;
  final String? initialValue;
  final int? minLines;
  final int? maxLines;
  final bool readOnly;
  final bool isHideTitle;
  final FormFieldValidator<String>? validation;
  final List<TextInputFormatter>? inputFormat;
  final TextInputType keyboardType;
  final TextInputAction inputAction;
  final TextCapitalization? textCapitalization;

  const CustomTextFieldTeknisi({
    Key? key,
    this.controller,
    this.onTap,
    this.onSubmit,
    this.action,
    this.label,
    this.hint,
    this.readOnly = false,
    this.isHideTitle = false,
    this.minLines,
    this.maxLines,
    this.validation,
    this.inputFormat,
    this.textCapitalization,
    this.keyboardType: TextInputType.text,
    this.inputAction: TextInputAction.done,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isHideTitle
            ? SizedBox()
            : Text(
                label ?? '',
                style: Constants.blacktextStyle,
              ),
        SizedBox(
          height: 8,
        ),
        TextFormField(
          onChanged: action ?? (value) {},
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
          initialValue: initialValue,
          maxLines: maxLines,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          onFieldSubmitted: onSubmit ?? (value) {},
          minLines: minLines,
          keyboardType: keyboardType,
          textInputAction: inputAction,
          validator: validation,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: Constants.blacktextStyle,
          inputFormatters: inputFormat ?? [],
          
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
              borderRadius: const BorderRadius.all(
                const Radius.circular(6),
              ),
            
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
              borderRadius: const BorderRadius.all(
                const Radius.circular(6),
              ),
            ),
            fillColor: Colors.white,
            filled: true,
            focusColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
        ),
      ],
    );
  }
}
