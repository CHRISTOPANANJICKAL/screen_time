import 'package:blocstudy/DataModel/data_model.dart';
import 'package:blocstudy/Functions/fetch_api_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';

class FreeTimeUsage extends StatelessWidget {
  final DataModel dataModel;
  const FreeTimeUsage(this.dataModel,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.percentWidth*5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Free-time Usage",style: GoogleFonts.robotoCondensed(fontSize: context.percentWidth *6,fontWeight: FontWeight.w500),),
          SizedBox(
            height: context.percentHeight * 1.5,
          ),
          UsedAndMaxText(dataModel.freeTime,dataModel.freeTimeMaxUsage),
          SizedBox(
            height: context.percentHeight * 1.2,
          ),
          SizedBox(
            height: context.percentHeight * 2.5,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: LinearProgressIndicator(
                value: dataModel.freeTime/dataModel.freeTimeMaxUsage,
                // valueColor: AlwaysStoppedAnimation<Color>(Color(0xff00ff00)),
                color: Colors.green,
                backgroundColor:Colors.blue[50],
              ),
            ),
          ),
          SizedBox(
            height: context.percentHeight * 2.8,
          ),
          MaterialButton(
              textColor:Colors.blue,
              shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: const BorderSide(
                width: 2,
                color: Colors.blue,)),
              onPressed: () {

              },
              minWidth: double.maxFinite,
              height: context.percentHeight*6,
            child:Text("Extend Free-time",style:TextStyle(fontWeight: FontWeight.w900,fontSize: context.percentWidth*3.5),)
          ),
          TextButton(onPressed: (){},
              style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
              ),
              child: const Text(
                "Change Time Restrictions",style: TextStyle(color: Colors.blue),
              ))
        ]
      ),
    );
  }
}



class UsedAndMaxText extends StatelessWidget {
  final int used;
  final int max;
  const UsedAndMaxText( this.used, this.max,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Used",style:TextStyle(fontSize: context.percentWidth*4,fontWeight: FontWeight.w500)),
            Text(formatDuration(Duration(minutes:(used))),style:TextStyle(color: Colors.green,fontSize: context.percentWidth*5.8,fontWeight: FontWeight.w900)),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text("Max",style:TextStyle(fontSize: context.percentWidth*4,fontWeight: FontWeight.w500)),
            Text(formatDuration(Duration(minutes:(max))),style:TextStyle(fontSize: context.percentWidth*5.8,fontWeight: FontWeight.w900)),
          ],
        )
      ],
    );
  }
}
