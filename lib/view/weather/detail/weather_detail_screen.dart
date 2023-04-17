import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zk_weather/common/zk_theme.dart';
import 'package:zk_weather/generated/l10n.dart';
import 'package:zk_weather/viewModel/weather_detail_view_model.dart';

class WeatherDetailScreen extends StatelessWidget {
  final screenWidth = ScreenUtil().screenWidth;
  WeatherDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(30);
    var details = [
      ['', '3级', '东北风'],
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var vm = WeatherDetialViewModel.load("116.41,39.92");
        },
        child: const Icon(Icons.touch_app_outlined),
      ),
      //backgroundColor: const Color(0xff98AFDF),
      backgroundColor: const Color(0xff98AFDF),

      body: SingleChildScrollView(
          child: SafeArea(
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.only(top: 170.h),
            child: ClipRRect(
                borderRadius:
                    const BorderRadius.only(topLeft: radius, topRight: radius),
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
                  height: 1.5.sh,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.current.beijing,
                  style: ZKAppTheme.largeTextStyle.copyWith(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30.r,
                ),
                SizedBox(
                  height: 65.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      getdayCell("今天", false),
                      getdayCell("明天", false),
                      getdayCell("周六", false),
                      getdayCell("周日", true),
                      getdayCell("周一", false),
                      getdayCell("周二", false),
                      getdayCell("周三", false),
                    ],
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
                        const Text(
                          "-3°/1°",
                          style: TextStyle(color: Colors.black, fontSize: 60),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 30.w),
                          child: const Text(
                            "多云",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w300),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                GridView.count(
                  //padding: const EdgeInsets.all(10),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  shrinkWrap: true, // 宽高自适应
                  physics: const NeverScrollableScrollPhysics(), //取消滚动
                  crossAxisCount: 3, //一行几个
                  children: [
                    getDetailCell(),
                    getDetailCell(),
                    getDetailCell(),
                    getDetailCell(),
                    getDetailCell(),
                    getDetailCell(),
                  ],
                ),
                const Text("当天24小时"),
                Container(
                  height: 1,
                  color: Colors.grey[200],
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Stack(
                      children: [
                        SizedBox(
                          width: screenWidth * 3,
                          height: 500,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              getHoursCell(),
                              getHoursCell(),
                              getHoursCell(),
                              getHoursCell(),
                              getHoursCell(),
                              getHoursCell(),
                              getHoursCell(),
                              getHoursCell(),
                              getHoursCell(),
                              getHoursCell(),
                              getHoursCell(),
                              getHoursCell(),
                              getHoursCell(),
                              getHoursCell(),
                              getHoursCell(),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 180,
                          child: Padding(
                            padding: EdgeInsets.only(left: 35.0.r),
                            child: SizedBox(
                              width: (screenWidth - 23.5.r) * 3,
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
                                          spots: [
                                            const FlSpot(0, 13),
                                            const FlSpot(1, 13),
                                            const FlSpot(2, 16),
                                            const FlSpot(3, 17),
                                            const FlSpot(4, 18),
                                            const FlSpot(5, 13),
                                            const FlSpot(6, 13),
                                            const FlSpot(7, 16),
                                            const FlSpot(8, 17),
                                            const FlSpot(9, 18),
                                            const FlSpot(10, 13),
                                            const FlSpot(11, 13),
                                            const FlSpot(12, 16),
                                            const FlSpot(13, 17),
                                            const FlSpot(14, 18),
                                          ]),
                                      LineChartBarData(
                                          color: Colors.blue[300],
                                          dotData: FlDotData(
                                            show: false,
                                          ),
                                          isCurved: true,
                                          spots: [
                                            const FlSpot(0, 10),
                                            const FlSpot(1, 8),
                                            const FlSpot(2, 8),
                                            const FlSpot(3, 10),
                                            const FlSpot(4, 10),
                                            const FlSpot(5, 13),
                                            const FlSpot(6, 9),
                                            const FlSpot(7, 9),
                                            const FlSpot(8, 11),
                                            const FlSpot(9, 10),
                                            const FlSpot(10, 8),
                                            const FlSpot(11, 6),
                                            const FlSpot(12, 9),
                                            const FlSpot(13, 9),
                                            const FlSpot(14, 9),
                                          ])
                                    ],
                                    borderData: FlBorderData(
                                        border: Border.all(
                                            style: BorderStyle.none)),
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
          ),
        ]),
      )),
    );
  }

  Widget getdayCell(dayInWeek, isHighlight) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        width: 50.w,
        decoration: BoxDecoration(
            color: isHighlight
                ? const Color(0xffffffff)
                : const Color(0xffffffff).withOpacity(.2),
            borderRadius: const BorderRadius.all(Radius.circular(50))),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("$dayInWeek",
              style: TextStyle(
                  color: isHighlight ? Colors.black : Colors.white,
                  fontSize: 15)),
          const SizedBox(
            height: 8,
          ),
          Text('04/14',
              style: TextStyle(
                  color: isHighlight ? Colors.black : Colors.white,
                  fontSize: 15))
        ]),
      ),
    );
  }

  Widget getDetailCell() {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Padding(
        padding: EdgeInsets.only(left: 10.w, top: 10.h),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.wind_power_outlined,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '三级',
                style: ZKAppTheme.smallTextStyle
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              Text(
                '东北风',
                style: ZKAppTheme.smallTextStyle.copyWith(
                    color: Colors.grey, fontWeight: FontWeight.normal),
              ),
            ]),
      ),
    );
  }

  Widget getHoursCell() {
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
              "周三",
              style: ZKAppTheme.smallTextStyle
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              '04/19',
              style: ZKAppTheme.smallTextStyle
                  .copyWith(color: Colors.grey, fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "多云",
              style: ZKAppTheme.smallTextStyle.copyWith(
                  color: Colors.black87, fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 8,
            ),
            Image.asset(
              "asset/icons/day-qing.png",
              width: 26.r,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "16°",
              style: ZKAppTheme.smallTextStyle
                  .copyWith(color: Colors.black, fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 80,
            ),
            Text(
              "16°",
              style: ZKAppTheme.smallTextStyle
                  .copyWith(color: Colors.black, fontWeight: FontWeight.normal),
            ),
            Image.asset(
              "asset/icons/night-qing.png",
              width: 26.r,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "多云",
              style: ZKAppTheme.smallTextStyle.copyWith(
                  color: Colors.black87, fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "西北风3级",
              style: ZKAppTheme.smallTextStyle.copyWith(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
