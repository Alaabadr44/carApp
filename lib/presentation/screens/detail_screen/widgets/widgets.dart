import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../../configuration/image/timage.dart';
import '../../../../configuration/tcontext.dart';
import '../../../../data/response/home/home_res_model.dart';
import '../../../../style/colors.dart';
import '../../../../style/textstyles.dart';
import '../../../../util/icons.dart';
import '../../home_screen/widgets/widgets.dart';

class DetailScreenRowButtons extends StatelessWidget {
  const DetailScreenRowButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 120.h,
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DetailScreenCircleBottomButton(
                    backGroundColor: Colors.greenAccent,
                    iconColor: Colors.green,
                    iconPath: iconCarPageCall,
                    onPressed: () {},
                  ),
                  DetailScreenCircleBottomButton(
                    backGroundColor: Colors.blueAccent,
                    iconColor: mainColor,
                    iconPath: iconCarPageChatByWHatsApp,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DetailScreenBottomIconButton(
                  buttonColor: mainColor,
                  buttonText: "موقع السيارة",
                  iconColor: Colors.white,
                  iconPath: iconCarPageLocation,
                  textColor: Colors.white,
                  onPressed: () {},
                ),
                const SizedBox(width: 10),
                DetailScreenBottomIconButton(
                  buttonColor: Colors.white,
                  buttonText: "إحجز سيارتك",
                  iconColor: mainColor,
                  iconPath: iconCarPageBook,
                  textColor: mainColor,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreenCircleBottomButton extends StatelessWidget {
  const DetailScreenCircleBottomButton({
    Key? key,
    required this.iconPath,
    required this.iconColor,
    required this.backGroundColor,
    required this.onPressed,
  }) : super(key: key);
  final String iconPath;
  final Color iconColor;
  final Color backGroundColor;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: CircleAvatar(
        backgroundColor: backGroundColor.withOpacity(0.3),
        foregroundColor: Colors.transparent,
        radius: 20,
        child: SvgPicture.asset(
          iconPath,
          height: 15,
          width: 15,
          color: iconColor,
        ),
      ),
    );
  }
}

class DetailScreenBottomIconButton extends StatelessWidget {
  const DetailScreenBottomIconButton({
    Key? key,
    required this.buttonText,
    required this.iconPath,
    required this.iconColor,
    required this.buttonColor,
    required this.textColor,
    required this.onPressed,
  }) : super(key: key);
  final String buttonText;
  final String iconPath;
  final Color buttonColor;
  final Color iconColor;
  final Color textColor;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

// just for solution for location icon
    Icon? location = iconPath == iconCarPageLocation
        ? Icon(
            Icons.location_on_outlined,
            color: Colors.white.withOpacity(0.45),
            size: 25,
          )
        : null;

    return SizedBox(
      height: 30.h,
      width: 120,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: location == null
            ? SvgPicture.asset(
                iconPath,
                height: 15.h,
                width: 15.w,
                color: iconColor,
                fit: BoxFit.cover,
              )
            : SizedBox(child: location),
        label: Text(
          buttonText,
          style: TextStyle(
            color: textColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(30),
              left: Radius.circular(30),
            ),
            side: BorderSide(
              color: mainColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}

class DetailScreenCarSupplier extends StatelessWidget {
  const DetailScreenCarSupplier({
    Key? key,
    required this.name,
    required this.imgPath,
  }) : super(key: key);
  final String name;
  final String imgPath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffEDF1F3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TNetImage(
              path: imgPath,
              height: 25,
              width: 25,
              fit: BoxFit.fill,
              borderRadius: BorderRadius.circular(50),
            ),
            Text(
              name,
              style: fontBlack15Normal,
            ),
            Text(
              "كل السيارات",
              style: fontBlack15Normal,
            )
          ],
        ),
      ),
    );
  }
}

class DetailScreenCarTextDetails extends StatelessWidget {
  const DetailScreenCarTextDetails({
    Key? key,
    required this.detailText,
  }) : super(key: key);
  final String detailText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        detailText,
        style: fontBlack15SemiBold,
        overflow: TextOverflow.visible,
        textAlign: TextAlign.start,
      ),
    );
  }
}

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
        padding: const EdgeInsetsDirectional.only(start: 30),
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
            padding: const EdgeInsetsDirectional.only(start: 10),
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

class DetailScreenCarGuaranteedToBar extends StatelessWidget {
  const DetailScreenCarGuaranteedToBar({
    Key? key,
    required this.numKilo,
  }) : super(key: key);
  final String numKilo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Container(
          height: 35.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: const Color(0xffa55959),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(
                iconHomeAd4,
                height: 20,
                width: 20,
                color: Colors.white,
              ),
              Text(
                "مكفولة حتى $numKilo كم",
                style: fontWhite17Medium,
              ),
              const SizedBox(width: 10),
              const SizedBox(width: 5),
            ],
          )),
    );
  }
}

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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: fontBlack20Normal,
          ),
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

class DetailScreenCarInfoBar extends StatelessWidget {
  const DetailScreenCarInfoBar({
    Key? key,
    required this.cylinder,
    required this.yearOfManufacture,
    required this.kilometer,
  }) : super(key: key);

  final int kilometer;
  final int cylinder;
  final int yearOfManufacture;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 90.h,
          width: double.maxFinite,
          color: Colors.white,
        ),
        PositionedDirectional(
          top: -20.h,
          start: 0,
          end: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(width: 10),
              DetailScreenCarInfoItem(
                iconPath: iconCarPageSlindr,
                infoWord: "المحرك /  سليندر",
                infoValue: cylinder,
              ),
              DetailScreenCarInfoItem(
                iconPath: iconHomeAd2,
                infoValue: yearOfManufacture,
                infoWord: "سنة التصنيع",
              ),
              DetailScreenCarInfoItem(
                iconPath: iconHomeAd3,
                infoValue: kilometer,
                infoWord: "المشي",
              ),
              const SizedBox(width: 10),
            ],
          ),
        )
      ],
    );
  }
}

class DetailScreenCarInfoItem extends StatelessWidget {
  const DetailScreenCarInfoItem({
    Key? key,
    required this.iconPath,
    required this.infoWord,
    required this.infoValue,
  }) : super(key: key);

  final String iconPath;
  final String infoWord;
  final int infoValue;

  @override
  Widget build(BuildContext context) {
    double cardHeight = 110.h;
    double cardWidth = 100.w;

    return Container(
      height: cardHeight,
      width: cardWidth,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xfff7f7fd),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            height: cardHeight * 0.3,
            width: cardWidth * 0.3,
          ),
          SizedBox(height: cardHeight * 0.1),
          Text(
            infoWord,
            style: font13BlackMedium,
          ),
          Text(
            infoValue.toString(),
            style: font16BlackB,
          ),
        ],
      ),
    );
  }
}

class DetailScreenCarImageBar extends StatelessWidget {
  DetailScreenCarImageBar({
    Key? key,
    required this.carImg,
  }) : super(key: key);
  String carImg;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 234.h,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            child: TNetImage(
              path: carImg,
              height: 234.h,
              width: double.maxFinite,
              fit: BoxFit.fill,
            ),
          ),
          Positioned.directional(
            textDirection: TextDirection.rtl,
            top: 10,
            start: 5,
            child: DetailScreenIconWidget(
              iconPath: iconBackIcon,
              onIconPress: () {
                Get.back();
              },
            ),
          ),
          Positioned.directional(
            textDirection: TextDirection.rtl,
            top: 10,
            end: 10,
            child: Row(
              children: [
                DetailScreenIconWidget(
                  iconPath: iconCarPageShare,
                  onIconPress: () {},
                ),
                const SizedBox(width: 10),
                DetailScreenIconWidget(
                  iconPath: iconCarPageFav,
                  onIconPress: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DetailScreenIconWidget extends StatelessWidget {
  const DetailScreenIconWidget({
    Key? key,
    required this.iconPath,
    required this.onIconPress,
  }) : super(key: key);
  final String iconPath;
  final void Function()? onIconPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onIconPress,
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.5),
        ),
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            height: 15,
            width: 15,
          ),
        ),
      ),
    );
  }
}

class DetailScreenOtherCarItem extends StatelessWidget {
  const DetailScreenOtherCarItem({
    Key? key,
    required this.carImage,
    required this.topHeadLineInfo,
    required this.detailsCarInfo,
    this.onCarItemPress,
  }) : super(key: key);

  final String carImage;
  final String topHeadLineInfo;
  final void Function()? onCarItemPress;
  final List<HomeDetailsCarItem> detailsCarInfo;
  @override
  Widget build(BuildContext context) {
    double height = TContext.getHeight(context);
    double width = TContext.getWidth(context);
    return GestureDetector(
      onTap: onCarItemPress,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: height * 0.25,
            width: width * 0.49,
            child: Image.asset(
              carImage,
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomCenter,
              height: 20,
              width: 20,
            ),
          ),
          Positioned.directional(
            textDirection: TextDirection.rtl,
            top: 0,
            start: 0,
            end: 0,
            child: Container(
              width: 250.w,
              height: 20.h,
              color: Colors.white.withOpacity(0.5),
              child: Center(
                child: Text(
                  topHeadLineInfo,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: mainColor,
                    // fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
          Positioned.directional(
            textDirection: TextDirection.rtl,
            bottom: -10,
            start: 0,
            end: 0,
            child: SizedBox(
              width: 290.w,
              height: 45.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: detailsCarInfo,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
