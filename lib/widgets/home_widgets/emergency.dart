import 'package:assignment_saleheen/widgets/home_widgets/emergencies/ambulance.dart';
import 'package:assignment_saleheen/widgets/home_widgets/emergencies/firebrigade.dart';
import 'package:assignment_saleheen/widgets/home_widgets/emergencies/policeemergency.dart';
import 'package:flutter/material.dart';

class Emergency extends StatelessWidget {
  const Emergency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 190,
      child: ListView(
        
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          PoliceEmergency(),
          Ambulance(),
          Firebrigade(),

          
        ],
      ),
    );
  }
}