import 'package:flutter/material.dart';

/*
FormInputFieldWithIcon(
                controller: _email,
                iconPrefix: Icons.link,
                labelText: 'Post URL',
                validator: Validator.notEmpty,
                keyboardType: TextInputType.multiline,
                minLines: 3,
                onChanged: (value) => print('changed'),
                onSaved: (value) => print('implement me'),
              ),
*/

class FormInputFieldWithIconWidget extends StatelessWidget {
  const FormInputFieldWithIconWidget({
    required this.controller,
    required this.iconPrefix,
    required this.labelText,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.minLines = 1,
    this.maxLines,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.readOnly = false,
    this.textCapitalization,
    this.next,
    this.fieldFocusNode,
    this.maxLenght,
    this.onPrefixTap,
    this.onSuffixTap,
  });

  final TextEditingController controller;
  final IconData iconPrefix;
  final String labelText;
  final String? Function(String?)? validator;
  final TextCapitalization? textCapitalization;
  final TextInputType keyboardType;
  final TextInputAction? next;
  final bool obscureText;
  final bool readOnly;
  final int? minLines;
  final int? maxLines;
  final int? maxLenght;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final void Function()? onPrefixTap;
  final void Function()? onSuffixTap;
  final FocusNode? fieldFocusNode;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextFormField(
        focusNode: fieldFocusNode,
        decoration: InputDecoration(
            //  filled: true,
            prefixIcon: IconButton(
              icon: Icon(iconPrefix),
              onPressed: onPrefixTap,
            ),
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.help_outline,
                color: Colors.amber,
              ),
              onPressed: onSuffixTap,
            ),
            labelText: labelText,
            errorMaxLines: 2),
        controller: controller,
        onSaved: onSaved,
        autocorrect: false,
        enableSuggestions: false,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        onChanged: onChanged,
        textInputAction: TextInputAction.next,
        onTap: onTap,
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLength: maxLenght,
        maxLines: maxLines ?? 1,
        minLines: minLines,
        validator: validator,
        readOnly: readOnly,
      ),
    );
  }
}
