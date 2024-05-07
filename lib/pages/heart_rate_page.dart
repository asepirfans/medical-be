import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medical_app/controllers/sensor_con.dart';
import 'package:medical_app/models/sensor_model.dart';
import 'package:medical_app/routes/route_name.dart';
import './widgets/grafik.dart';

class HeartRate extends StatelessWidget {
  const HeartRate({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (!didPop) {
          Get.offAllNamed(
            RouteName.homePage,
          );
          return;
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xFFE8E8E8),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  _nameWidget(),
                  _valueWidget(context),
                  _realtimeGraph(),
                  _historycalGraph(),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _realtimeGraph() {
    final SensorController sensorController = Get.put(SensorController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          "Realtime Graph",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        GrafikWidget(
          sensorController: sensorController,
          dataType: DataType.ecg,
        ),
      ],
    );
  }

  _historycalGraph() {
    final SensorController sensorController = Get.put(SensorController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          "Historycal Graph",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        GrafikWidget(
          sensorController: sensorController,
          dataType: DataType.heartRate,
        ),
      ],
    );
  }

  _nameWidget() {
    return Text(
      "Heart Rate",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _valueWidget(BuildContext context) {
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
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Text(
                      "${sensor.data.last.hr}",
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Text(
                      "BPM",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFA6A6A6),
                ),
                child: Center(
                  child: Text(
                    "Low",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
