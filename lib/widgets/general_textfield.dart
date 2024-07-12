import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitz/constants/color.dart';
import 'package:habitz/constants/icon.dart';
import 'package:habitz/constants/padding.dart';
import 'package:habitz/constants/style.dart';

enum TextFieldType {
  obscured,
  notObscured,
}

class GeneralTextField extends StatefulWidget {
  GeneralTextField({
    super.key,
    this.hintText = "",
    this.textFieldType = TextFieldType.notObscured,
    required this.controller,
  });

  final String hintText;
  final TextFieldType textFieldType;
  final TextEditingController controller;
  bool tappedEye = false;

  @override
  State<GeneralTextField> createState() => _GeneralTextFieldState();
}

class _GeneralTextFieldState extends State<GeneralTextField> {
  @override
  void didUpdateWidget(covariant GeneralTextField oldWidget) {
    widget.tappedEye = oldWidget.tappedEye;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.generalWidth,
      child: TextField(
        maxLines: 1,
        textAlignVertical: TextAlignVertical.center,
        style: AppTextStyles.mediumBlack,
        controller: widget.controller,
        obscureText:
            widget.textFieldType == TextFieldType.obscured && !widget.tappedEye
                ? true
                : false,
        cursorColor: AppColors.stroke,
        decoration: InputDecoration(
          isCollapsed: false,
          constraints: BoxConstraints.tightFor(
            height: 60.h,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 20.h,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.stroke,
              width: 1.w,
            ),
            borderRadius: BorderRadius.circular(
              12.r,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.secondary,
              width: 1.w,
            ),
            borderRadius: BorderRadius.circular(
              12.r,
            ),
          ),
          suffixIconConstraints: BoxConstraints(
            maxHeight: 24.w,
            maxWidth: 40.w,
          ),
          suffixIcon: widget.textFieldType == TextFieldType.obscured
              ? Padding(
                  padding: EdgeInsets.only(
                    right: 16.w,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.tappedEye = !widget.tappedEye;
                      });
                    },
                    child: Image.asset(
                      AppIcons.eyeIcon,
                      color:
                          widget.tappedEye ? AppColors.blue : AppColors.stroke,
                    ),
                  ),
                )
              : null,
          hintText: widget.hintText,
          hintStyle: AppTextStyles.mediumBlack,
        ),
      ),
    );
  }
}
