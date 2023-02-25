import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configuration/tcontext.dart';
import '../../../style/colors.dart';
import '../../../style/text_styles.dart';

class SearchFelid extends StatelessWidget {
  const SearchFelid({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    return Center(
      child: TextField(
        cursorColor: kMainColor,
        keyboardType: TextInputType.text,
        onChanged: onChanged,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          constraints: BoxConstraints(
              maxWidth: TContext.getWidth(context) - 60, maxHeight: 50.h),
          alignLabelWithHint: true,
          hintText: "إبحث عن سيارتك",
          hintStyle: bold20MainColor,
          prefixIcon: const Icon(
            Icons.search,
            color: kMainColor,
            size: 30,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey, width: 4),
            // gapPadding:
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: kMainColor, width: 2),
            // gapPadding:
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        ),
      ),
    );
  }
}
