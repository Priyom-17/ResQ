import 'package:assignment_saleheen/widgets/home_widgets/live_safe/PoliceStationCard.dart';
import 'package:flutter/material.dart';

import 'home_widgets/live_safe/BusStationCard.dart';
import 'home_widgets/live_safe/HospitalCard.dart';
import 'home_widgets/live_safe/PharmacyCard.dart';

class LiveSafe extends StatelessWidget {
  const LiveSafe({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      child:ListView(
       physics:BouncingScrollPhysics(),
       scrollDirection: Axis.horizontal,
       children:[
        PoliceStationCard(),
        HospitalCard(),
        PharmacyCard(),
        BusStationCard(),

       ] ,
      ),
    );
  }
}