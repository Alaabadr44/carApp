// detail_screen_car_specifications
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/response/home/home_res_model.dart';
import '../../../../style/text_styles.dart';

class DetailScreenCarSpecifications extends StatelessWidget {
  const DetailScreenCarSpecifications(
    this._list, {
    Key? key,
  }) : super(key: key);
  final List<Features> _list;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      width: double.infinity,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding:  EdgeInsetsDirectional.only(start: 30.w),
        itemCount: _list.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 1,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          var info = _list[index];
          return Container(
            height: 35.h,
            color: const Color(0xfff7f7fd),
            alignment: AlignmentDirectional.centerStart,
            padding:  EdgeInsetsDirectional.only(start: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.vertical_align_bottom),
                      Text(
                        info.key,
                        style: fontBlack15Bold,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 30.w),
                      Text(
                        info.value,
                        style: fontBlack15Bold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
