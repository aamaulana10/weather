import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:myweather2/feature/home/presentation/HomePresenter.dart';
import 'package:myweather2/helper/ConvertHelper.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomePresenter presenter = Get.put(HomePresenter());

  @override
  void initState() {
    super.initState();

    initializeDateFormatting();

    presenter.getCurrentTimeType();
    presenter.getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePresenter>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            child: Stack(
              children: [
                Positioned.fill(
                  // child: controller.getCurrentTimeType()
                  child: Image(
                    image: AssetImage(controller.weatherTypeModel.image!),
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 60, left: 16, right: 16, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                            SizedBox(width: 4),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.address,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400)),
                                SizedBox(height: 2),
                                Text(
                                  "${ConvertHelper.toFullDate(DateTime.now())}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  "http://openweathermap.org/img/w/" +
                                      "${controller.weatherForecastModel.current?.weather?.first.icon}" +
                                      ".png",
                                  errorBuilder: (ctx, obj, error) {
                                    return Container();
                                  },
                                ),
                                Text(
                                    "It's ${controller.weatherForecastModel.current?.weather?.first.description}",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white)),
                              ],
                            ),
                            Expanded(
                              child: Text(
                                "${controller.weatherForecastModel.current?.temp?.toStringAsFixed(0) ?? 0}°C",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 60, color: Colors.white),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    height: 250,
                    padding: EdgeInsets.only(top: 24, bottom: 24),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.black.withOpacity(0.3)),
                    child: Column(
                      children: [
                        Text(
                          "Weather Today",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        SizedBox(height: 24),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                            controller.weatherForecastModel.daily?.length,
                            padding: EdgeInsets.only(right: 16, left: 16),
                            itemBuilder: (ctx, idx) {
                              var hourlyData =
                              controller.weatherForecastModel.hourly?[idx];

                              return Container(
                                width: 80,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 45,
                                      width: 45,
                                      child: Image.network(
                                        "http://openweathermap.org/img/w/" +
                                            "${hourlyData?.weather?.first.icon}" +
                                            ".png",
                                        errorBuilder: (ctx, obj, error) {
                                          return Container();
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      ConvertHelper.milisToHour(
                                          hourlyData?.dt ?? 0),
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "${hourlyData?.temp?.toStringAsFixed(0) ?? 0}°",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
