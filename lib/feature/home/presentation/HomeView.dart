import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image(
                image: AssetImage("lib/assets/image/noon.jpeg"),
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
                            Text("Jakarta, Indonesia",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(height: 2),
                            Text(
                              "Saturday, 10 Dec 2022",
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
                                  "10n" +
                                  ".png",
                              errorBuilder: (ctx, obj, error) {
                                return Container();
                              },
                            ),
                            Text(
                                "It's Cloudy",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white)),
                          ],
                        ),
                        Expanded(
                          child: Text(
                            "20°C",
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
                        itemCount: 8,
                        padding: EdgeInsets.only(right: 16, left: 16),
                        itemBuilder: (ctx, idx) {

                          return Container(
                            width: 80,
                            child: Column(
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  child: Image.network(
                                    "http://openweathermap.org/img/w/" +
                                        "10n" +
                                        ".png",
                                    errorBuilder: (ctx, obj, error) {
                                      return Container();
                                    },
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text("10:00 am",
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "20°",
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
        )
      ),
    );
  }
}
