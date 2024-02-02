import 'package:assignment_saleheen/widgets/home_widgets/live_safe/PoliceStationCard.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home_widgets/live_safe/BusStationCard.dart';
import 'home_widgets/live_safe/HospitalCard.dart';
import 'home_widgets/live_safe/PharmacyCard.dart';

class LiveSafe extends StatelessWidget {
  const LiveSafe({super.key});

  static Future<void> openMap(String location) async {
    String googleUrl='https://www.google.com/maps/search/$location';
    final Uri _url = Uri.parse(googleUrl);
    try {
      await launchUrl(_url);
    } catch (e) {
  
      
    }
  }

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