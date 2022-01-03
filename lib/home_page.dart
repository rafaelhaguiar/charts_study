import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<_PieData> pieData = [
    _PieData("Outro1", 1, "teste 1"),
    _PieData("outro2", 3, "Teste 2"),
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo[900],
      child: SafeArea(
        child: ListView(
          children: [
            Center(
                child: SfCircularChart(
                    palette: const [
                      Colors.red,
                      Colors.green,
                    ],
                    legend: Legend(
                      isVisible: false,
                    ),
                    series: <DoughnutSeries<_PieData, String>>[
                      DoughnutSeries<_PieData, String>(
                        dataSource: pieData,
                        xValueMapper: (_PieData data, _) => data.xData,
                        yValueMapper: (_PieData data, _) => data.yData,
                        dataLabelMapper: (_PieData data, _) => data.text,
                        innerRadius: "50",
                        dataLabelSettings: const DataLabelSettings(
                          isVisible: true,
                          labelPosition: ChartDataLabelPosition.outside,
                          textStyle: TextStyle(
                            color: Colors.white,
                          ),
                          connectorLineSettings: ConnectorLineSettings(
                            type: ConnectorType.line,
                            color: Colors.white,
                            width: 4,
                          ),
                        ),
                      ),
                    ]))
          ],
        ),
      ),
    );
  }
}

class _PieData {
  _PieData(this.xData, this.yData, this.text);
  final String xData;
  final num yData;
  final String text;
}
