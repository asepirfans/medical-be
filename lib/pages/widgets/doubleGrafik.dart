import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/controllers/sensor_con.dart';
import '../../models/sensor_model.dart';

class DoubleGrafik extends StatelessWidget {
  const DoubleGrafik({
    super.key,
    required this.sensorController,
  });

  final SensorController sensorController;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: sensorController.sensorStream,
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
        final List<Sensor> recentSensors = snapshot.data!.take(5).toList();

        List<Datum> recentData =
            recentSensors.expand((sensor) => sensor.data).toList();

        return Padding(
          padding: const EdgeInsets.only(right: 30, left: 15, top: 10),
          child: Container(
            height: 220,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  show: true,
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            value.toInt().toString(),
                            style: TextStyle(
                              color: const Color(0xff7589a2),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        DateTime dateTime =
                            recentData[value.toInt()].waktu.toLocal();
                        return Padding(
                          padding: const EdgeInsets.only(top: 7),
                          child: Text(
                            DateFormat('HH:mm:ss').format(dateTime),
                            style: TextStyle(
                              color: const Color(0xff7589a2),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(
                      color: Color.fromARGB(255, 55, 77, 59), width: 1),
                ),
                minX: 0,
                maxX: 4,
                minY: 0,
                maxY: 200,
                lineBarsData: [
                  LineChartBarData(
                    spots: recentData
                        .asMap()
                        .entries
                        .map((entry) {
                          return FlSpot(
                            entry.key.toDouble(),
                            entry.value.sys.toDouble(),
                          );
                        })
                        .take(5)
                        .toList(),
                    isCurved: true,
                    color: Color(0xFF6CE5E8),
                    belowBarData: BarAreaData(
                      show: false,
                      color: Color.fromARGB(255, 70, 145, 84),
                    ),
                  ),
                  LineChartBarData(
                    spots: recentData
                        .asMap()
                        .entries
                        .map((entry) {
                          return FlSpot(
                            entry.key.toDouble(),
                            entry.value.dys.toDouble(),
                          );
                        })
                        .take(5)
                        .toList(),
                    isCurved: true,
                    color: Color(0xFF6CE55D),
                    belowBarData: BarAreaData(
                      show: false,
                      color: Color.fromARGB(255, 70, 145, 84),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
