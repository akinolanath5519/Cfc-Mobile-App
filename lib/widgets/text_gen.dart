import 'package:cfc/widgets/size_utility.dart';
import 'package:cfc/widgets/theme.dart';
import 'package:flutter/material.dart';


extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get outlineBlack => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.h),
        borderSide: BorderSide(
          color: appTheme.black90001.withOpacity(0.38),
          width: 1,
        ),
      );
  static OutlineInputBorder get fillGray => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.h),
        borderSide: BorderSide.none,
      );
}

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {Key? key,
      this.alignment,
      this.width,
      this.onChanged,
      this.initialValue,
      this.scrollPadding,
      this.controller,
      this.focusNode,
      this.autofocus = false,
      this.textStyle,
      this.obscureText = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType,
      this.maxLines,
      this.hintText,
      this.hintStyle,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.contentPadding,
      this.borderDecoration,
      this.fillColor,
      this.enabled,
      this.filled = false,
      this.validator})
      : super(
          key: key,
        );

  final Alignment? alignment;

  final double? width;

  final TextEditingController? scrollPadding;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final bool? obscureText;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;
  final String? initialValue;

  final Color? fillColor;
  final bool? enabled;
  final Function(String)? onChanged;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget(context))
        : textFormFieldWidget(context);
  }

  Widget textFormFieldWidget(BuildContext context) => SizedBox(
        width: width ?? double.maxFinite,
        child: TextFormField(
          initialValue: initialValue,
          enabled: enabled,
          scrollPadding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          controller: controller,
          focusNode: focusNode,
          onTapOutside: (event) {
            if (focusNode != null) {
              focusNode?.unfocus();
            } else {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          autofocus: autofocus!,
          style: textStyle ?? theme.textTheme.bodyMedium,
          obscureText: obscureText!,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          onChanged: onChanged,
          decoration: decoration,
          //validator: validator,
        ),
      );
  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? theme.textTheme.bodySmall,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.only(
              left: 15.h,
              top: 17.v,
              bottom: 17.v,
            ),
        fillColor: fillColor,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.h),
              borderSide: BorderSide(
                color: appTheme.indigo100,
                width: 1,
              ),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.h),
              borderSide: BorderSide(
                color: appTheme.indigo100,
                width: 1,
              ),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.h),
              borderSide: BorderSide(
                color: appTheme.indigo100,
                width: 1,
              ),
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.h),
          borderSide: BorderSide(
            color: theme.colorScheme.onPrimary,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.h),
          borderSide: BorderSide(
            color: theme.colorScheme.onPrimary,
            width: 1,
          ),
        ),
        errorStyle: TextStyle(
          color: theme.colorScheme.onPrimary,
          fontSize: 12.fSize,
        ),
      );
}
