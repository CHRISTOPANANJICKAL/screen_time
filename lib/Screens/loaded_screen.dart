import 'package:blocstudy/DataModel/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Widgets/by_devices.dart';
import 'Widgets/dash_board.dart';
import 'Widgets/free_time_usage.dart';

class LoadedScreen extends StatelessWidget {
  final DataModel dataModel;
  const LoadedScreen({Key? key, required this.dataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(

      child: Column(
        children: [
          DashBoard(dataModel),
          const Divider(
            indent: 15,
            endIndent: 15,
            height: 50,
            thickness: 1.5,
          ),
          FreeTimeUsage(dataModel),
          const Divider(
            indent: 15,
            endIndent: 15,
            height: 15,
            thickness: 1.5,
          ),
          ByDevices(dataModel)
        ],
      )
    );
  }
}








// void _drawArcWithCenter(
//     Canvas canvas,
//     Paint paint, {
//       required Offset center,
//       required double radius,
//       startRadian = 0.0,
//       sweepRadian = pi,
//     }) {
//   canvas.drawArc(
//     Rect.fromCircle(center: center, radius: radius),
//     startRadian,
//     sweepRadian,
//     false,
//     paint,
//   );
// }


