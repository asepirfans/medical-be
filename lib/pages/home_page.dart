import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medical_app/controllers/sensor_con.dart';

import 'package:medical_app/controllers/user_controller.dart';
import 'package:medical_app/models/sensor_model.dart';
import 'package:medical_app/routes/route_name.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _nameWidget(),
              _healthOverview(context),
              _nameMyHealth(),
              _cardMonitor(context),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  _cardMonitor(BuildContext context) {
    final SensorController sensorC = Get.put(SensorController());

    return StreamBuilder(
        stream: sensorC.sensorStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('Tidak ada data'),
            );
          }
          final Sensor sensor = snapshot.data!.last;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HeartBeat(
                      color: Color(0xFF3685CD),
                      bpm: sensor.data.last.hr,
                      satuan: "BPM",
                      name: "Heart Beat",
                      icon: Icons.healing,
                      onTap: () {
                        Get.offAllNamed(RouteName.heartRate);
                      },
                    ),
                    SizedBox(width: 15),
                    HeartBeat(
                      color: Color(0xFF0097B2),
                      bpm: '${sensor.data.last.sys}\n${sensor.data.last.dys}',
                      satuan: "mmHg",
                      name: "Blood Pressure",
                      icon: Icons.healing,
                      onTap: () {
                        Get.offAllNamed(RouteName.bloodPressure);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HeartBeat(
                      color: Color(0xFFEF476F),
                      bpm: sensor.data.last.temp,
                      satuan: "°C",
                      name: "Temperature",
                      icon: Icons.healing,
                      onTap: () {
                        Get.offAllNamed(RouteName.bodyTemperature);
                      },
                    ),
                    SizedBox(width: 15),
                    HeartBeat(
                      color: Color(0xFF26547C),
                      bpm: sensor.data.last.spo2,
                      satuan: "%",
                      name: "SpO2",
                      icon: Icons.healing,
                      onTap: () {
                        Get.offAllNamed(RouteName.saturationOxygen);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HeartBeat(
                      color: Color(0xFF8D5D39),
                      bpm: sensor.data.last.ecg,
                      satuan: "BPM",
                      name: "Respiration",
                      icon: Icons.healing,
                    ),
                    SizedBox(width: 15),
                    HeartBeat(
                      color: Color(0xFF3685CD),
                      bpm: "Air",
                      satuan: "",
                      name: "Breathing",
                      icon: Icons.healing,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                HeartBeat(
                  color: Color(0xFFFF3131),
                  bpm: "Alert",
                  satuan: "",
                  name: "Consciousness",
                  icon: Icons.healing,
                ),
              ],
            ),
          );
        });
  }

  _nameMyHealth() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
      child: Text(
        "My Health",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  _healthOverview(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Health Overview",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Container(
              height: 120,
              width: Get.width,
              decoration: BoxDecoration(
                color: Color(0xFF3685CD),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Clinical Risk",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Low",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Ward-based response",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        height: 80,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFF38B6FF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "NEWS SCORE",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "0",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _nameWidget() {
    final UserController _userC = Get.put(UserController());
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 70,
        width: Get.width,
        decoration: BoxDecoration(
          color: Color(0xFF414141),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 30,
                  color: Color(0xFF414141),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, ${_userC.name}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Guest",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeartBeat extends StatefulWidget {
  final bpm;
  final satuan;
  final name;
  final Color color;
  final IconData icon;
  final Function()? onTap;
  const HeartBeat({
    super.key,
    required this.bpm,
    required this.satuan,
    required this.name,
    required this.color,
    required this.icon,
    this.onTap,
  });

  @override
  State<HeartBeat> createState() => _HeartBeatState();
}

class _HeartBeatState extends State<HeartBeat> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 140,
        height: 130,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    widget.icon,
                    size: 60,
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text(
                        "${widget.bpm}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1,
                        ),
                      ),
                      Text(
                        "${widget.satuan}",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "${widget.name}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
