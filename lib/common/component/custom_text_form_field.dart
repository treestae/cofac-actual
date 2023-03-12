import 'package:actual/common/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String errorText;
  final bool obscureText;
  final bool autofocus;
  final ValueChanged<String>? onChanged;

  const CustomTextFormField({
    super.key,
    this.hintText = '',
    this.errorText = '',
    this.obscureText = false,
    this.autofocus = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
      borderSide: BorderSide(color: inputBorderColor, width: 1),
      borderRadius: BorderRadius.circular(10),
    );

    return Theme(
      data: ThemeData(colorScheme: ColorScheme.fromSwatch(errorColor: Colors.red)),
      child: TextFormField(
        cursorColor: primaryColor,
        obscureText: obscureText,
        autofocus: autofocus,
        onChanged: onChanged,        
        inputFormatters: [LengthLimitingTextInputFormatter(10), FilteringTextInputFormatter.singleLineFormatter],
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value!.isEmpty) {
            return '이름을 입력해주세요';
          }
          if (value.length < 3) {
            // 최소 3자 이상을 입력해야 합니다.
            return '최소 3자 이상 입력해주세요';
          }
          return null;
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(20),
            hintText: hintText,
            hintStyle: TextStyle(color: bodyTextColor, fontSize: 14),
            errorText: errorText.isNotEmpty ? errorText : null,
            fillColor: inputBgColor,
            filled: true,
            enabledBorder: baseBorder,
            border: baseBorder,
            focusedBorder: baseBorder.copyWith(
              borderSide: baseBorder.borderSide.copyWith(color: primaryColor),
            )),
      ),
    );
  }
}
