import 'package:blocstudy/DataModel/data_model.dart';
import 'package:blocstudy/Functions/fetch_api_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';
import 'openpainter.dart';


class DashBoard extends StatelessWidget {
  final DataModel dataModel;
  const DashBoard(this.dataModel,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text("Dashboard",style: GoogleFonts.secularOne(fontSize: context.percentWidth *6,fontWeight: FontWeight.bold),),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 240,
              width: 190,
              child: CustomPaint(
                foregroundPainter: RadialPainter(width: 14,line1Color: Colors.blue,line2Color: Colors.orange,line3Color: Colors.green,percent1: dataModel.classTime.toDouble(),percent2:dataModel.studyTime.toDouble(),percent3: dataModel.freeTime.toDouble()),
              ),
            ),
            Column(
              children:[
                const Text('Total',
                  style: TextStyle(fontSize: 26,fontWeight: FontWeight.w800),
                ),
                Text(formatDuration(Duration(minutes:(dataModel.totalTime))),
                  style: const TextStyle(fontSize: 26,fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],

        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAndText(Colors.blue,"Class",formatDuration(Duration(minutes:(dataModel.classTime)))),
            CircleAndText(Colors.deepOrange,"Study",formatDuration(Duration(minutes:(dataModel.studyTime)))),
            CircleAndText(Colors.green,"Free-time",formatDuration(Duration(minutes:(dataModel.freeTime)))),
          ],
        ),

      ],
    );
  }
}



class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}


class CircleAndText extends StatelessWidget {
  final Color color;
  final String category ;
  final String duration;
  const CircleAndText(this.color,this.category,this.duration,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5),
          decoration:BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          width: 20,
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text(category,style: const TextStyle(fontWeight: FontWeight.w600)),
            Text(duration,style: const TextStyle(fontWeight: FontWeight.bold),)
          ],
        )
      ],
    );
  }
}











