import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traffic_safety/src/constants/colors.dart';


class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton(
      {super.key,
        this.onChanged,
        required this.items,
        this.selectedItem,
        required this.hintText});

  final Function(dynamic)? onChanged;
  final List<String> items;
  final String? selectedItem;
  final String hintText;

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return DropdownButtonHideUnderline(
      child: Container(
        decoration: decor,
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
              value: widget.selectedItem,
              padding: EdgeInsets.symmetric(vertical: 5.h),
              isExpanded: true,
              hint: Text(widget.hintText,
                  style: textTheme.bodyLarge!
                      .copyWith(color: blueColor, fontSize: 12.sp)),
              items: widget.items
                  .map<DropdownMenuItem>((item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
                ),
              ))
                  .toList(),
              onChanged: widget.onChanged),
        ),
      ),
    );
  }
}

BoxDecoration decor = BoxDecoration(
  color: const Color(0xffF9F9F9),
  border: Border.all(color: const Color(0xffF4F4F4)),
  borderRadius: BorderRadius.circular(10.r),
);
