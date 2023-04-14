import 'package:flutter/material.dart';
import 'package:zk_weather/common/zk_theme.dart';
import 'package:zk_weather/generated/l10n.dart';

class WeatherDetailScreen extends StatelessWidget {
  const WeatherDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xff98AFDF),
      backgroundColor: const Color(0xeeF4F6FB),
      body: Stack(children: [
        Container(
          color: const Color(0xff98AFDF),
          width: double.infinity,
          height: double.infinity,
        ),
        SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  S.current.beijing,
                  style: ZKAppTheme.largeTextStyle.copyWith(fontSize: 30),
                ),
              ),
            ),
            SizedBox(
              height: 100,
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
            Stack(children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color(0xeeF4F6FB),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Text(
                                    "-3°/1°",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 60),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 30),
                                    child: Text(
                                      "多云",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        GridView.count(
                          padding: const EdgeInsets.all(10),
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
                        const Padding(
                          padding: EdgeInsets.only(left: 10, top: 30),
                          child: Text("当天24小时"),
                        ),
                        SizedBox(
                          height: 300,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: const [],
                          ),
                        )
                      ]),
                ),
              ),
              const Icon(
                Icons.sunny,
                color: Colors.yellow,
                size: 200,
              ),
            ])
          ]),
        ),
      ]),
    );
  }

  Widget getdayCell(dayInWeek, isHighlight) {
    return Container(
      width: 70,
      margin: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          color:
              isHighlight ? const Color(0xffffffff) : const Color(0xffA4B6E2),
          borderRadius: const BorderRadius.all(Radius.circular(50))),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
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
        padding: const EdgeInsets.only(left: 20, top: 40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Icon(Icons.wind_power_outlined),
              SizedBox(
                height: 20,
              ),
              Text("3级"),
              Text("东北风")
            ]),
      ),
    );
  }
}
