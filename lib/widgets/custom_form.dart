import 'package:flutter/material.dart';
import 'package:todos_porto_2/app_resources.dart';

class CustomForm extends StatefulWidget {
  final TextEditingController textEditingController;
  final TextInputAction? textInputAction;
  final double? width;
  final double? height;
  final String? hintText;
  final Color? backgroundColor;
  final double? borderRadius;
  final bool? isObsecure;
  final AssetImage? logo;
  final FocusNode? focusNode;
  final TextStyle? inputStyle;
  final TextAlign? textAlign;
  final TextStyle? hintStyle;
  final BoxBorder? borders;
  final bool? enabled;
  final void Function(String)? onChanged;
  final void Function()? onEdittingComplete;
  const CustomForm({
    super.key,
    required this.textEditingController,
    this.textInputAction,
    this.width,
    this.height,
    this.hintText,
    this.backgroundColor,
    this.borderRadius,
    this.isObsecure,
    this.logo,
    this.focusNode,
    this.inputStyle,
    this.textAlign,
    this.hintStyle,
    this.borders,
    this.enabled,
    this.onChanged,
    this.onEdittingComplete,
  });
  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  bool obscured = false;
  @override
  void initState() {
    obscured = widget.isObsecure ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 48,
      width: widget.width ?? double.maxFinite,
      decoration: BoxDecoration(
          color: widget.backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
          border: widget.borders),
      child: Row(
        children: [
          const SizedBox(width: 15),
          widget.logo != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ImageIcon(widget.logo,
                      color: colors(context).primaryCr),
                )
              : const SizedBox(),
          Expanded(
            child: TextFormField(
              enabled: widget.enabled,
              onChanged: widget.onChanged,
              onEditingComplete: widget.onEdittingComplete,
              focusNode: widget.focusNode,
              controller: widget.textEditingController,
              validator: (value) {
                if (value == "tes") {
                  return "test error";
                }
                return null;
              },
              obscureText: obscured,
              textInputAction: widget.textInputAction,
              style: widget.inputStyle ?? normalText,
              textAlign: widget.textAlign ?? TextAlign.start,
              decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: widget.hintStyle ??
                      normalText
                          .copyWith(fontSize: 13, color: Colors.black45),
                  isCollapsed: true,
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(width: 15),
          if (widget.isObsecure == true)
            InkWell(
              onTap: () {
                obscured = !obscured;
                setState(() {});
              },
              child: obscured
                  ? const Icon(Icons.visibility_off_rounded)
                  : const Icon(Icons.visibility_rounded),
            ),
          if (widget.isObsecure == true) const SizedBox(width: 15)
        ],
      ),
    );
  }
}
