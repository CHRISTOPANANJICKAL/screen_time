import 'package:blocstudy/DataModel/data_model.dart';
import 'package:blocstudy/Functions/fetch_api_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';

class ByDevices extends StatelessWidget {
  final DataModel dataModel;
  const ByDevices(this.dataModel,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.percentHeight*2,
        ),
        Text("By Devices",style: GoogleFonts.robotoCondensed(fontSize: context.percentWidth *6,fontWeight: FontWeight.w500)),
        SizedBox(
          height: context.percentHeight * 2.5,
        ),
        IconAndText(FontAwesomeIcons.mobileAlt,"Adi's Phone",dataModel.deviceUsageTotalTimeMobile),
        SizedBox(
          height: context.percentHeight * 2.5,
        ),
        IconAndText(FontAwesomeIcons.laptop,"Adi's Laptop",dataModel.deviceUsageTotalTimeLaptop),
        TextButton(onPressed: (){},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
            ),
            child: const Text(
              "See All Devices",style: TextStyle(color: Colors.blue),
            ))
      ],
    );
  }
}


class IconAndText extends StatelessWidget {
  final IconData icon;
  final String name;
  final int duration;
  const IconAndText( this.icon, this.name,this.duration,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(icon,size: context.percentWidth*14,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,style: GoogleFonts.robotoCondensed(fontSize: context.percentWidth *4.5,fontWeight: FontWeight.w600)),
            Text(formatDuration(Duration(minutes:(duration))),style: const TextStyle(color: Colors.blue),),
          ],
        )
      ],
    );
  }
}
