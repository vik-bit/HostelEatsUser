import 'package:flutter/material.dart';
import 'package:main_project/global/global.dart';
import 'package:main_project/mainScreens/home_screen.dart';
import 'package:main_project/models/address.dart';
import 'package:main_project/models/seller.dart';
import 'package:main_project/splashScreen/splash_screen.dart';
import 'package:main_project/widgets/address_design.dart';
import 'whatsapp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';









class ShipmentAddressDesign extends StatelessWidget
{
  final Address? model;


  ShipmentAddressDesign({this.model});



  @override
  Widget build(BuildContext context)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
              'Delivery Details:',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
          ),
        ),
        const SizedBox(
          height: 6.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 5),
          width: MediaQuery.of(context).size.width,
          child: Table(
            children: [
              TableRow(
                children: [
                  const Text(
                    "Name",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(model!.name!),
                ],
              ),
              TableRow(
                children: [
                  const Text(
                    "Phone Number",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(model!.phoneNumber!),

                ],

              ),
              TableRow(
                children: [
                  const Text(
                    "Block",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(model!.fullAddress!),

                ],

              ),
            ],

          ),

        ),

        const SizedBox(
          height: 80.0,
        ),



    Center(

    child: Text(
  'Order has been sent to the outlet,\nconfirmation will be sent via WhatsApp.',
  textAlign: TextAlign.center,
  style: TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
  ),
  ),
  ),


    ],
    );
  }
}
