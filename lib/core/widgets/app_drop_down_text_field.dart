import 'package:diva/core/themes/colors.dart';
import 'package:diva/core/themes/text_styles.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDropdownTextField extends StatefulWidget {
  const AppDropdownTextField({
    super.key,
    this.onSaved,
    this.validator,
    this.onChanged,
    this.resetKey,
    this.value,
    this.fillColor,
    this.label,
    this.options = const [],
    this.enabled = true,
    this.focusedBorder,
    this.enabledBorder,
    this.borderRadius,
    this.contentPadding,
  });

  final String? Function(Object?)? validator;
  final void Function(Object?)? onSaved;
  final String? label;
  final bool enabled;
  final List<dynamic> options;
  final Color? fillColor;
  final Object? value;
  final void Function(Object?)? onChanged;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final GlobalKey<FormFieldState<dynamic>>? resetKey;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? contentPadding;

  @override
  State<AppDropdownTextField> createState() => _AppDropdownTextFieldState();
}

class _AppDropdownTextFieldState extends State<AppDropdownTextField> {
  Object? value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      style: TextStyles.font18BlackW400,

      key: widget.resetKey,
      value: value,
      isExpanded: true,
      iconStyleData: IconStyleData(
        openMenuIcon: Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: const Icon(Icons.arrow_drop_up, color: Colors.black45),
        ),
        icon: value == null
            ? Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: const Icon(Icons.arrow_drop_down, color: Colors.black45),
              )
            : Row(
                children: [
                  IconButton(
                    onPressed: () => setState(() => value = null),
                    icon: const Icon(Icons.clear, size: 16),
                    splashRadius: 14,
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                  ),
                  const SizedBox(width: 8),
                  Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
      ),
      decoration: InputDecoration(
        contentPadding:
            widget.contentPadding ?? EdgeInsets.symmetric(vertical: 12.h),
        fillColor: widget.fillColor,
        filled: widget.fillColor != null,
        label: widget.label != null ? Text(widget.label!) : null,
        enabled: widget.enabled,
        // Add Horizontal padding using menuItemStyleData.padding so it matches
        // the menu padding when button's width is not specified.
        isDense: false,
        isCollapsed: true,
        border: OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(30),
          borderSide: const BorderSide(
            width: 2,
            color: ColorsManager.lightGray,
          ),
        ),
        enabledBorder: widget.enabledBorder ??
            OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(30),
              borderSide: const BorderSide(
                width: 2,
                color: ColorsManager.lightGray,
              ),
            ),
        focusedBorder: widget.focusedBorder ??
            OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(30),
              borderSide: const BorderSide(
                width: 2,
                color: ColorsManager.vividRed,
              ),
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(30),
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(30),
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        // Add more decoration..
      ),
      items: widget.options
          .map(
            (option) => DropdownMenuItem(
              value: option,
              child: Text(
                option as String,
              ),
            ),
          )
          .toList(),
      validator: widget.validator,
      onChanged: (value) {
        if (widget.onChanged != null) widget.onChanged!.call(value);
        setState(() {
          this.value = value;
        });
      },
      onSaved: widget.onSaved,
      // iconStyleData: const IconStyleData(
      //   openMenuIcon: Icon(Icons.arrow_drop_up, color: Colors.black45),
      //   icon: Icon(Icons.arrow_drop_down, color: Colors.black45),
      //   iconSize: 24,
      // ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      ),
      menuItemStyleData: MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
      ),
    );
  }
}
