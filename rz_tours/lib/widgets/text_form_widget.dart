import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget myTextFormField({
  required TextEditingController controller,
  required FormFieldValidator<String> validator,
  bool passwordVisible = false,
  TextInputType textInputType = TextInputType.text,
  required String label,
  required IconData prefixIcon,
  Widget? suffixIcon,
  GestureTapCallback? onTap,
}) {
  return TextFormField(
    onTap: onTap,
    validator: validator,
    obscureText: passwordVisible,
    controller: controller,
    keyboardType: textInputType,
    decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon),
  );
}

// Widget myTextStyle({
//      fontFamily='italic',
// }) {
//   return TextStyle(
//       fontFamily: fontFamily,
//   );
// }
