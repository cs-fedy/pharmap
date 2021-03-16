import 'package:flutter/material.dart';
import 'package:pharmap/utils/constants.dart';

class CustomTextFormField extends FormField<String> {
  CustomTextFormField(
      {FormFieldSetter<String> onSaved,
      FormFieldValidator<String> validator,
      TextInputType keyboardType = TextInputType.text,
      String initialValue = "",
      String fieldLabel,
      bool isPassword = false,
      bool obscureText = false,
      bool autovalidate = false})
      : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidate: autovalidate,
            builder: (FormFieldState<String> state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(fieldLabel),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20.0, right: 5.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: darkPrimaryColor,
                      ),
                    ),
                    child: TextFormField(
                      obscureText: obscureText,
                      keyboardType: keyboardType,
                      cursorColor: darkPrimaryColor,
                      decoration: InputDecoration(
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
                  ),
                ],
              );
            });
}
