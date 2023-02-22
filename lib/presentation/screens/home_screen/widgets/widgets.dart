import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../configuration/image/timage.dart';
import '../../../../configuration/tcontext.dart';
import '../../../../data/response/home/home_res_model.dart';
import '../../../../model/home_Cars_Grid_item.dart';
import '../../../../style/colors.dart';
import '../../../../style/textstyles.dart';
import '../../../../util/icons.dart';
import '../../../styled_component/widgets.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar(
    this.notificationNum, {
    Key? key,
  }) : super(key: key);

  final int notificationNum;

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return Container(
      height: 70.h,
      width: double.infinity,
      padding: EdgeInsets.only(
        top: statusbarHeight * 2,
        right: 10.w,
        left: 10.w,
      ),
      // margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            appBarBackGroundColorFirst,
            appBarBackGroundColorSecond,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 25,
                width: 20,
                child: SvgPicture.asset(
                  iconHomeMenu,
                ),
              ),
              NotificationWidget(
                notificationNum: notificationNum,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CarStoryItem extends StatelessWidget {
  const CarStoryItem({
    Key? key,
    required this.carImagePath,
    required this.carType,
  }) : super(key: key);

  final String carImagePath;
  final String carType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Container(
          height: 70,
          width: 70,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(
              color: circleBorderColor,
            ),
            shape: BoxShape.circle,
          ),
          child: TNetImage(
            path: carImagePath,
            fit: BoxFit.fill,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Text(
          carType,
          style: bold15(),
        )
      ],
    );
  }
}

class CarsStoryBar extends StatelessWidget {
  CarsStoryBar(
    this.stories, {
    Key? key,
  }) : super(key: key);
  List<Story> stories;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      padding: const EdgeInsetsDirectional.only(start: 15, top: 2),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: stories.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 10.w);
        },
        itemBuilder: (BuildContext context, int index) {
          var story = stories[index];
          return CarStoryItem(
            carImagePath: story.imagePath,
            carType: story.title,
          );
        },
      ),
    );
  }
}

class HomeImageBar extends StatelessWidget {
  const HomeImageBar({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;
  @override
  Widget build(BuildContext context) {
    double height = TContext.getHeight(context);
    return SizedBox(
      width: double.infinity,
      height: height * 0.25,
      child: TNetImage(
        path: imagePath,
        fit: BoxFit.fill,
      ),
    );
  }
}

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  TextEditingController? search;

  @override
  void initState() {
    search = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    search!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = TContext.getHeight(context);
    return Container(
      height: height * 0.08,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SearchFelid(search: search),
    );
  }
}

class SearchFelid extends StatelessWidget {
  const SearchFelid({
    Key? key,
    required this.search,
  }) : super(key: key);

  final TextEditingController? search;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: mainColor,
      keyboardType: TextInputType.text,
      controller: search,
      textAlign: TextAlign.center,
      onSubmitted: (String searchValue) {},
      decoration: InputDecoration(
        alignLabelWithHint: true,
        hintText: "إبحث عن سيارتك",
        hintStyle: bold20MainColor,
        prefixIcon: const Icon(
          Icons.search,
          color: mainColor,
          size: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey, width: 4),
          // gapPadding:
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey, width: 2),
          // gapPadding:
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }
}

class HomeOptionsBar extends StatelessWidget {
  const HomeOptionsBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          HomeOptionButtonItem(
            buttonText: "أسيوي",
            onPressed: () {},
          ),
          HomeOptionButtonItem(
            buttonText: "أوروبي",
            onPressed: () {},
          ),
          HomeOptionButtonItem(
            buttonText: "أمريكى",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class GridCarsView extends StatelessWidget {
  const GridCarsView(
    this.cars, {
    Key? key,
    required this.onCarItemPress,
  }) : super(key: key);

  final Function(Car) onCarItemPress;

  final List<Car> cars;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        crossAxisSpacing: 5,
        mainAxisSpacing: 1.80,
        crossAxisCount: 2,
        children: <Widget>[
          ...cars
              .map(
                (car) => Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 5),
                  child: HomeCarGridItem(
                    onCarItemPress: () => onCarItemPress(car),
                    carImage: car.imagePath,
                    topHeadLineInfo: car.topHeadLine,
                    detailsCarInfo: [
                      HomeDetailsCarItem(
                        iconPath: getCarInfoTypeIconPath(CarDetails.salary),
                        infoType: getCarInfoTypeWord(CarDetails.salary),
                        infoValue: "12700",
                      ),
                      HomeDetailsCarItem(
                        iconPath: getCarInfoTypeIconPath(
                            CarDetails.yearOfManufacture),
                        infoType:
                            getCarInfoTypeWord(CarDetails.yearOfManufacture),
                        infoValue: "2019",
                      ),
                      HomeDetailsCarItem(
                        iconPath: getCarInfoTypeIconPath(CarDetails.kilometer),
                        infoType: getCarInfoTypeWord(CarDetails.kilometer),
                        infoValue: "20000",
                      ),
                      HomeDetailsCarItem(
                        // iconPath: "",
                        iconPath:
                            getCarInfoTypeIconPath(CarDetails.guaranteedTo),
                        infoType: getCarInfoTypeWord(CarDetails.guaranteedTo),
                        infoValue: "2021",
                      ),
                    ],
                  ),
                ),
              )
              .toList()
        ],
      ),
    );
  }
}

class HomeCarGridItem extends StatelessWidget {
  const HomeCarGridItem({
    Key? key,
    required this.carImage,
    required this.topHeadLineInfo,
    required this.detailsCarInfo,
    this.onCarItemPress,
  }) : super(key: key);

  final String carImage;
  final String topHeadLineInfo;
  final Function()? onCarItemPress;
  final List<HomeDetailsCarItem> detailsCarInfo;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCarItemPress,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                height: 200,
                width: 350,
                child: TNetImage(
                  path: carImage,
                  fit: BoxFit.fill,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 250,
                  height: 20,
                  color: Colors.white.withOpacity(0.5),
                  child: Center(
                    child: Text(
                      topHeadLineInfo,
                      style: boldDefaultMainColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          PositionedDirectional(
            bottom: -10,
            start: 0,
            end: 0,
            child: SizedBox(
              width: 270.w,
              height: 45.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: detailsCarInfo,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HomeDetailsCarItem extends StatelessWidget {
  final String iconPath;
  final String infoType;
  final String infoValue;
  const HomeDetailsCarItem({
    Key? key,
    required this.iconPath,
    required this.infoType,
    required this.infoValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.120,
      color: const Color(0xffF7F7FD).withOpacity(0.9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SvgPicture.asset(
              iconPath,
              height: 10,
              width: 10,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                infoType,
                style: font12BlackW200,
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
          const SizedBox(height: 2),
          Expanded(
            child: Text(
              infoValue,
              style: font10BlackBold,
            ),
          ),
        ],
      ),
    );
  }
}
