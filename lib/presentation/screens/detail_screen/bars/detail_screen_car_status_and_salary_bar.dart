// detail_screen_car_status_and_salary_bar
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../style/text_styles.dart';

class DetailScreenCarStatusAndSalaryBar extends StatelessWidget {
  const DetailScreenCarStatusAndSalaryBar({
    Key? key,
    required this.title,
    required this.salary,
  }) : super(key: key);
  final String title;
  final String salary;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: fontBlack20Normal,
            ),
          ),
          const SizedBox(width: 5),
          Wrap(
            children: [
              Text(
                salary,
                style: fontBlack25B,
              ),
              Text(
                " د.ك ",
                style: fontBlack20Light,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
