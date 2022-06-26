import 'BarMmodel.dart';
import 'DB/SummaryDb.dart';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;

class Summary extends StatefulWidget {
  String Token;
  Widget child;
  Summary({Key key, this.child, this.Token}) : super(key: key);
  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  List<String> sex = ['Female', 'Male', 'MixSex'];
  String ssex = 'Female';
  List<String> type = ['Intake', 'Fcr', 'Weight'];
  String stype = 'Intake';
  List<String> View_by = [
    'Summary_Reill',
    'Usage by House',
    'Remain by House',
    'Refill by House',
    'Summary Usage',
    'Summary Usage by House',
    'Summary Refill',
    'Summary Refill by House',
    'Summary Remain(Recheck)'
  ];
  String sView_by = 'Summary_Reill';
  // List<charts.Series<Sales, int>> _seriesLineData;
  // List<charts.Series<TimeSeriesSales, DateTime>> _seriesLineData1;
  var linesalesdata0;
  var linesalesdata1;
  var linesalesdata2;
  // var linesalesdata3;
  // var linesalesdata4;
  // var linesalesdata5;
  // var linesalesdata6;
  // var linesalesdata7;
  // var linesalesdata8;
  // var linesalesdata9;
  // var linesalesdata10;
  // var linesalesdata11;
  bool loading = true;
  SummaryDb _summaryDb;
  List<Map<String, double>> result1;
  var s;

  Future<void> getjaon() async {
    var url =
        Uri.parse("https://smartfarmpro.com/v1/api/summary/age-information");
    var resp = await http.post(url,
        headers: {"Authorization": 'Bearer ${widget.Token}'},
        body: {"Farm": '1', "Crop": '5', "Formula": ssex, "Data": "1"});
    _summaryDb = summaryDbFromJson(resp.body);
    result1 = _summaryDb.result;
    setState(() {
          loading = false;
        });
    return _summaryDb;
  }
// List<charts.Series<Map<String, double>, double>> _createSampleData() {
//   try{
//                       // var linesalesdata0 = [
//                       //   for (int i = 0; i < 9; i++) 
//                       //   BarMmodel(0, 200),
//                       //   BarMmodel(1, 230),
//                       //   BarMmodel(2, 290),
//                       //   BarMmodel(3, 300),
//                       //   BarMmodel(4, 290),
//                       //   BarMmodel(5, 203),
//                       //   BarMmodel(6, 200),
//                       // ];
//                       // var linesalesdata1 = [
//                       //   BarMmodel(0, 200),
//                       //   BarMmodel(1, 230),
//                       //   BarMmodel(2, 290),
//                       //   BarMmodel(3, 300),
//                       //   BarMmodel(4, 290),
//                       //   BarMmodel(5, 203),
//                       //   BarMmodel(6, 200),
//                       // ];
//                       return [
//                         charts.Series<Map<String, double> , double>(
//                           colorFn: (__, _) =>
//                               charts.ColorUtil.fromDartColor(Color(0xff990099)),
//                           id: 'Air1',
//                           data: _summaryDb.result,
//                           domainFn: (Map<String, dynamic>  result0, _) => double.parse('${result0[40]["day"]}'),
//                           measureFn: (Map<String, dynamic>  result0, _) => double.parse('${result0[40]["TARGET"]}'),
//                         ),
//                         charts.Series<Map<String, double> , double>(
//                           colorFn: (__, _) =>
//                               charts.ColorUtil.fromDartColor(Color(0xff109618)),
//                           id: 'Air2',
//                           data: _summaryDb.result,
//                           domainFn: (Map<String, dynamic>  result0, _) => double.parse('${result0[40]["day"]}'),
//                           measureFn: (Map<String, dynamic>  result0, _) =>double.parse('${result0[40]["AVERAGE"]}'),
//                         ),
//                       ];
//   }catch(e){
//     print('e ===> ${e.toString()} ');
//   }
//                     }


    List<charts.Series<BarMmodel, int>> _createSampleData() {
      if(ssex=='Female'){

   linesalesdata0 = [
      BarMmodel(0, 2000),
      BarMmodel(1, 2300),
      BarMmodel(2, 2900),
      BarMmodel(3, 3000),
      BarMmodel(4, 2900),
      BarMmodel(5, 2030),
      BarMmodel(6, 2000),
    ];
    linesalesdata1 = [
      BarMmodel(0, 200),
      BarMmodel(1, 230),
      BarMmodel(2, 290),
      BarMmodel(3, 300),
      BarMmodel(4, 290),
      BarMmodel(5, 203),
      BarMmodel(6, 200),
    ];
      }
      if(ssex=='Male'){

   linesalesdata0 = [
      BarMmodel(0, 200),
      BarMmodel(1, 2300),
      BarMmodel(2, 2900),
      BarMmodel(3, 3000),
      BarMmodel(4, 290),
      BarMmodel(5, 2030),
      BarMmodel(6, 2000),
    ];
    linesalesdata1 = [
      BarMmodel(0, 200),
      BarMmodel(1, 230),
      BarMmodel(2, 2090),
      BarMmodel(3, 300),
      BarMmodel(4, 2900),
      BarMmodel(5, 203),
      BarMmodel(6, 200),
    ];
      }
      if(ssex=='MixSex'){

   linesalesdata0 = [
      BarMmodel(0, 200),
      BarMmodel(1, 2300),
      BarMmodel(2, 290),
      BarMmodel(3, 3000),
      BarMmodel(4, 290),
      BarMmodel(5, 2030),
      BarMmodel(6, 200),
    ];
    linesalesdata1 = [
      BarMmodel(0, 2000),
      BarMmodel(1, 230),
      BarMmodel(2, 2900),
      BarMmodel(3, 3000),
      BarMmodel(4, 2900),
      BarMmodel(5, 203),
      BarMmodel(6, 200),
    ];
      }
    return [
      charts.Series<BarMmodel, int>(
         colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
          id: 'Air1',
          data: linesalesdata0,
          domainFn: (BarMmodel barModeel, _) => barModeel.yearval,
          measureFn: (BarMmodel barModeel, _) => barModeel.salesval,
      ),
       charts.Series<BarMmodel, int>(
         colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
          id: 'Air2',
          data: linesalesdata1,
          domainFn: (BarMmodel barModeel, _) => barModeel.yearval,
          measureFn: (BarMmodel barModeel, _) => barModeel.salesval,
      ),
    ];
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getjaon();
    _createSampleData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("Summry"),
          backgroundColor: Colors.green),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Age lnformation',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Center(
                        child: DropdownButton<String>(
                            value: stype,
                            items: type
                                .map((type) => DropdownMenuItem<String>(
                                    value: type,
                                    child: Text(
                                      type,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 18),
                                    )))
                                .toList(),
                            onChanged: (type) => setState(
                                  () => stype = type,
                                )

                            )),
                  ),
                  Text(
                    '|',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Expanded(
                    child: Center(
                        child: DropdownButton<String>(
                            value: ssex,
                            items: sex
                                .map((sex) => DropdownMenuItem<String>(
                                    value: sex,
                                    child: Text(
                                      sex,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(fontSize: 18),
                                    )))
                                .toList(),
                            onChanged: (sex) {
                              setState(() {
                                ssex = sex;
                              });

                              getjaon();
                               _createSampleData();
                              // _generateData();
                            })),
                  )
                ],
              ),
              loading ? LinearProgressIndicator()
              : Expanded(
                  child: charts.LineChart(
                    _createSampleData(),
                      // defaultRenderer:
                      //     new charts.LineRendererConfig(stacked: true),
                      animate: true,
                      animationDuration: Duration(seconds: 2),
                      behaviors: [
                        // new charts.SlidingViewport(),
                        new charts.PanAndZoomBehavior(),
                        new charts.SeriesLegend(),
                        new charts.ChartTitle('day',
                            behaviorPosition: charts.BehaviorPosition.bottom,
                            titleOutsideJustification:
                                charts.OutsideJustification.middleDrawArea),
                        new charts.ChartTitle('g.',
                            behaviorPosition: charts.BehaviorPosition.start,
                            titleOutsideJustification:
                                charts.OutsideJustification.middleDrawArea),
                      ]),
                ),
              Row(
                children: <Widget>[
                  Text(
                    'Daily Information',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Center(
                        child: DropdownButton<String>(
                      value: sView_by,
                      items: View_by.map((View_by) => DropdownMenuItem<String>(
                          value: View_by,
                          child: Text(
                            View_by,
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 18),
                          ))).toList(),
                      onChanged: (View_by) =>
                          setState(() => sView_by = View_by),
                    )),
                  )
                ],
              ),
              // Expanded(
              //   child: charts.TimeSeriesChart(_seriesLineData1,
              //       // defaultRenderer:
              //       //     new charts.LineRendererConfig(stacked: true),
              //       animate: true,
              //       animationDuration: Duration(seconds: 2),
              //       behaviors: [
              //         new charts.PanAndZoomBehavior(),
              //         new charts.SeriesLegend(),
              //         new charts.ChartTitle('day',
              //             behaviorPosition: charts.BehaviorPosition.bottom,
              //             titleOutsideJustification:
              //                 charts.OutsideJustification.middleDrawArea),
              //         new charts.ChartTitle('kg.',
              //             behaviorPosition: charts.BehaviorPosition.start,
              //             titleOutsideJustification:
              //                 charts.OutsideJustification.middleDrawArea),
              //       ]),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// class Sales {
//   SummaryDb summaryDb;
//   String salesval;

//   Sales(this.summaryDb, this.salesval);
// }

// class Sales {
//   var yearval;
//   var salesval;

//   Sales(this.yearval, this.salesval);
// }

// class TimeSeriesSales {
//   DateTime time;
//   int sales;

//   TimeSeriesSales(this.time, this.sales);
// }
