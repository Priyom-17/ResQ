import 'package:flutter/material.dart';

class HospitalCard extends StatelessWidget {
  final Function? onMapFunction;
  const HospitalCard({super.key,this.onMapFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              onMapFunction!('hospitals near me');
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 50,
                width: 50,
                child: Center(
                 child:Image.asset('lib/assets/hospital.png',
                 height:32,
                
                 ) ,
                ),
              ),
                
            ),
          ),
          Text(' Hospital')
        ],
      ),
    );
  }
}