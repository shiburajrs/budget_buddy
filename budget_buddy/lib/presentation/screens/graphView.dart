import 'package:budget_buddy/utils/colorUtils.dart';
import 'package:budget_buddy/utils/textConstants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../utils/assetUtils.dart';
import '../../utils/textStyleUtils.dart';


class GraphView extends StatefulWidget {
   GraphView({super.key,required this.keyValue});
bool keyValue = false;

  @override
  State<GraphView> createState() => _GraphViewState();
}

class _GraphViewState extends State<GraphView> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  final List<_ChartData> expenseData = [
    _ChartData("Food", 38.0),
    _ChartData("Tran.", 30.0),
    _ChartData("Util.", 30.0),
    _ChartData("Enter.", 10.0),
    _ChartData("Mis.", 20.0),
    _ChartData("Health.", 15.0),
    _ChartData("Educ.", 25.0),
    _ChartData("Shop.", 30.0),
  ];

// Data for income
  final List<_ChartData> incomeData = [
    _ChartData("Sala.", 40.0),
    _ChartData("Free.", 35.0),
    _ChartData("Inves.", 20.0),
    _ChartData("Rent", 30.0),
    _ChartData("Side.", 15.0),
    _ChartData("Inte.", 30.0),
  ];

  @override
  void initState() {
    data = [
      _ChartData("Food", 38.0),
      _ChartData("Tran.", 30.0),
      _ChartData("Util.", 30.0),
      _ChartData("Enter.", 10.0),
      _ChartData("Mis.", 20.0),
      _ChartData("Health.", 15.0),
      _ChartData("Educ.", 25.0),
      _ChartData("Shop.", 30.0)
    ];


    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    Widget chartDataView() {
      return SfCartesianChart(
          primaryXAxis: CategoryAxis( majorGridLines: MajorGridLines(width: 0),
            labelStyle: TextUtils.getPoppinsMedium(color: Colors.black,fontSize: 12),
          ),
          primaryYAxis: NumericAxis( majorGridLines: MajorGridLines(width: 0),
            minimum: 0, maximum: 40, interval: 10,
          labelStyle: TextUtils.getPoppinsMedium(color: Colors.black,fontSize: 12),),
          tooltipBehavior: _tooltip,
          series: <CartesianSeries<_ChartData, String>>[
            ColumnSeries<_ChartData, String>(
                dataSource: widget.keyValue ? incomeData : expenseData,
                xValueMapper: (_ChartData data, _) => data.x,
                yValueMapper: (_ChartData data, _) => data.y,
                name: widget.keyValue ? TextConstants.expense :TextConstants.income,
                color: widget.keyValue ? Colors.red : ColorUtils.primaryColor)
          ]);
    }
    return Scaffold(backgroundColor: Colors.white,
        body: chartDataView());
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}