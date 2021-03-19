import 'package:flutter/material.dart';
import 'package:pharmap/utils/constants.dart';

class CustomTextFormField extends FormField<String> {
  CustomTextFormField(
      {FormFieldSetter<String> onSaved,
      FormFieldValidator<String> validator,
      TextInputType keyboardType = TextInputType.text,
      String initialValue = "",
      String hintText,
      bool isPassword = false,
      bool obscureText = false,
      bool autovalidate = false})
      : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          autovalidate: autovalidate,
          builder: (FormFieldState<String> state) {
            return Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[100],
                  ),
                ),
              ),
              child: TextFormField(
                obscureText: obscureText,
                keyboardType: keyboardType,
                cursorColor: darkPrimaryColor,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  border: InputBorder.none,
                  suffixIcon: isPassword
                      ? IconButton(
                          icon: Icon(
                            obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () => state.setState(() {
                            obscureText = !obscureText;
                          }),
                        )
                      : null,
                ),
                onChanged: (String value) => state.didChange(value),
              ),
            );
          },
        );
}
