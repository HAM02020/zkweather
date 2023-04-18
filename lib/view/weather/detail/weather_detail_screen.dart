import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:zk_weather/bloc/weather_detail/weather_detail_bloc.dart';
import 'package:zk_weather/common/zk_theme.dart';
import 'package:zk_weather/viewModel/weather_detail_view_model.dart';

class WeatherDetailScreen extends StatefulWidget {
  int initialPage;
  late PageController pageController;

  WeatherDetailScreen({super.key, this.initialPage = 0}) {
    pageController = PageController(initialPage: initialPage);
  }

  @override
  State<WeatherDetailScreen> createState() => _WeatherDetailScreenState();
}

class _WeatherDetailScreenState extends State<WeatherDetailScreen> {
  final screenWidth = ScreenUtil().screenWidth;

  late int _curIndex = widget.initialPage;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(30);

    return BlocConsumer<WeatherDetailBloc, WeatherDetailState>(
      buildWhen: (previous, current) {
        return current is WeatherDetailDidLoadState;
      },
      listener: (context, state) {
        if (state is WeatherDetailLoadingState) {
          EasyLoading.show(status: "loading...");
        }
        if (state is WeatherDetailDidLoadState) {
          EasyLoading.dismiss(animation: true);
        }
      },
      builder: (context, state) {
        WeatherDetialViewModel? vm = state.vm;
        return Scaffold(
            backgroundColor: const Color(0xff98AFDF),
            body: PageView.builder(
              onPageChanged: (idx) => updateIndex(idx),
              controller: widget.pageController,
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                return getSinglePage(radius, vm);
              },
            ));
      },
    );
  }

  Widget getSinglePage(Radius radius, WeatherDetialViewModel? vm) {
    late final ItemScrollController itemScrollController =
        ItemScrollController();

    late final ItemPositionsListener itemPositionsListener =
        ItemPositionsListener.create();
    return SingleChildScrollView(
        child: Stack(children: [
      Padding(
        padding: EdgeInsets.only(top: 200.h),
        child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: radius, topRight: radius),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [
                    0.0,
                    0.3,
                  ],
                      colors: [
                    Colors.white.withOpacity(.4),
                    Colors.white
                  ])),
              width: double.infinity,
              height: 1.3.sh,
            )),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.r,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              vm?.cityName ?? "--",
              style: ZKAppTheme.largeTextStyle.copyWith(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 30.r,
          ),
          SizedBox(
            height: 65.h,
            child: ScrollablePositionedList.builder(
              itemScrollController: itemScrollController,
              itemPositionsListener: itemPositionsListener,
              itemCount: vm?.dateMap.keys.length ?? 0,
              itemBuilder: (context, index) {
                return getdayCell(
                  index: index,
                  date: vm?.dateMap.keys.toList()[index],
                  dayInWeek: vm?.dateMap.values.toList()[index],
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                "asset/image/big-weather.png",
                width: 0.4.sw,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${vm?.temp ?? "--"}°",
                    style: const TextStyle(color: Colors.black, fontSize: 60),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 30.w),
                    child: Text(
                      vm?.text ?? "-",
                      style: const TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w300),
                    ),
                  )
                ],
              ),
            ],
          ),
          GridView.count(
            padding: const EdgeInsets.all(10),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            shrinkWrap: true, // 宽高自适应
            physics: const NeverScrollableScrollPhysics(), //取消滚动
            crossAxisCount: 3, //一行几个
            children: [
              ...?vm?.detailItemList
                  ?.map((e) => getDetailCell(weatherDetailItemViewModel: e))
                  .toList(),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text("未来7天天气"),
          ),
          Container(
            height: 1,
            color: Colors.grey[200],
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Stack(
                children: [
                  SizedBox(
                    width: ((screenWidth - 20 * 2) / 5) * 7,
                    height: 500,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ...?vm?.weather7DayItemlist
                            ?.map((e) =>
                                getHoursCell(weather7DaysItemViewModel: e))
                            .toList()
                      ],
                    ),
                  ),
                  Positioned(
                    top: 180,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30.0.r),
                      child: SizedBox(
                        width: screenWidth * 1.08,
                        height: 50,
                        child: LineChart(
                          LineChartData(
                              lineBarsData: [
                                LineChartBarData(
                                    color: Colors.red[300],
                                    dotData: FlDotData(
                                      show: false,
                                    ),
                                    //belowBarData: BarAreaData(show: true),
                                    isCurved: true,
                                    spots: () {
                                      var tempList = vm?.tempMaxList ?? [];
                                      List<FlSpot> res = [];
                                      for (int i = 0;
                                          i < tempList.length;
                                          i++) {
                                        res.add(
                                            FlSpot(i.toDouble(), tempList[i]));
                                      }
                                      return res;
                                    }()),
                                LineChartBarData(
                                    color: Colors.blue[300],
                                    dotData: FlDotData(
                                      show: false,
                                    ),
                                    isCurved: true,
                                    spots: () {
                                      var tempList = vm?.tempMinList ?? [];
                                      List<FlSpot> res = [];
                                      for (int i = 0;
                                          i < tempList.length;
                                          i++) {
                                        res.add(
                                            FlSpot(i.toDouble(), tempList[i]));
                                      }
                                      return res;
                                    }()),
                              ],
                              borderData: FlBorderData(
                                  border: Border.all(style: BorderStyle.none)),
                              titlesData: FlTitlesData(show: false),
                              gridData: FlGridData(show: false),
                              lineTouchData: LineTouchData(
                                enabled: false,
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    ]));
  }

  void updateIndex(idx) {
    setState(() {
      _curIndex = idx;
    });
  }

  Widget getdayCell({date, dayInWeek, index}) {
    return InkWell(
      onTap: () {
        //itemScrollController.jumpTo(index: index);
        updateIndex(index);
        widget.pageController.animateToPage(index,
            duration: const Duration(milliseconds: 800), curve: Curves.ease);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          width: 50.w,
          decoration: BoxDecoration(
              color: _curIndex == index
                  ? const Color(0xffffffff)
                  : const Color(0xffffffff).withOpacity(.2),
              borderRadius: const BorderRadius.all(Radius.circular(50))),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("$dayInWeek",
                style: TextStyle(
                    color: _curIndex == index ? Colors.black : Colors.white,
                    fontSize: 15)),
            const SizedBox(
              height: 8,
            ),
            Text('$date',
                style: TextStyle(
                    color: _curIndex == index ? Colors.black : Colors.white,
                    fontSize: 15))
          ]),
        ),
      ),
    );
  }

  Widget getDetailCell(
      {required WeatherDetailItemViewModel weatherDetailItemViewModel}) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Padding(
        padding: EdgeInsets.only(left: 10.w, top: 10.h),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                weatherDetailItemViewModel.iconPath ?? 'asset/icons/fengsu.svg',
                width: 20.r,
                //theme: const SvgTheme(currentColor: Colors.black87),
                color: Colors.black54,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${weatherDetailItemViewModel.name}',
                style: ZKAppTheme.smallTextStyle
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              Text(
                '${weatherDetailItemViewModel.tip}',
                style: ZKAppTheme.smallTextStyle.copyWith(
                    color: Colors.grey, fontWeight: FontWeight.normal),
              ),
            ]),
      ),
    );
  }

  Widget getHoursCell(
      {required Weather7DaysItemViewModel weather7DaysItemViewModel}) {
    return SizedBox(
      width: ((screenWidth - 20 * 2) / 5),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 20.r,
            ),
            Text(
              "${weather7DaysItemViewModel.dayInWeek}",
              style: ZKAppTheme.smallTextStyle
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              '${weather7DaysItemViewModel.date}',
              style: ZKAppTheme.smallTextStyle
                  .copyWith(color: Colors.grey, fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "${weather7DaysItemViewModel.textDay}",
              overflow: TextOverflow.ellipsis,
              style: ZKAppTheme.smallTextStyle.copyWith(
                  color: Colors.black87, fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 8,
            ),
            weather7DaysItemViewModel.imgDay ??
                Image.asset(
                  "asset/icons/day-qing.png",
                  width: 26.r,
                ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "${weather7DaysItemViewModel.tempMax}",
              style: ZKAppTheme.smallTextStyle
                  .copyWith(color: Colors.black, fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 80,
            ),
            Text(
              "${weather7DaysItemViewModel.tempMin}",
              style: ZKAppTheme.smallTextStyle
                  .copyWith(color: Colors.black, fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 8,
            ),
            weather7DaysItemViewModel.imgNight ??
                Image.asset(
                  "asset/icons/night-qing.png",
                  width: 26.r,
                ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "${weather7DaysItemViewModel.textNight}",
              style: ZKAppTheme.smallTextStyle.copyWith(
                  color: Colors.black87, fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "${weather7DaysItemViewModel.windDir}",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: ZKAppTheme.smallTextStyle.copyWith(
                  color: Colors.black87,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
