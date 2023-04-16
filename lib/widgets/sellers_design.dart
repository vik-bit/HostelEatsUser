import 'package:flutter/material.dart';
import 'package:main_project/mainScreens/menus_screen.dart';
import 'package:main_project/models/seller.dart';
import 'package:main_project/widgets/upi.dart';
import 'package:main_project/widgets/whatsapp.dart';


class SellersDesignWidget extends StatefulWidget
{
  Seller? model;
  BuildContext? context;

  SellersDesignWidget({this.model, this.context});

  @override
  _SellersDesignWidgetState createState() => _SellersDesignWidgetState();
}



class _SellersDesignWidgetState extends State<SellersDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (c)=> MenusScreen(model: widget.model)));
      },
      splashColor: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 400,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [

              Image.network(
                  widget.model!.sellerAvatarUrl!,
                  height: 220.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 1.0,),
              Center(
                child: Text(
                  widget.model!.sellerName! + " (tap to see the menu)",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,

                    fontFamily: "TrainOne-Regular",
                  ),
                ),
              ),

              Center(

                child: ElevatedButton(

                  child: const Text("Whatsapp"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.cyan,
                  ),
                  onPressed: ()
                  {
                    openWhatsApp(widget.model!.phone!,"hi");
                  },
                ),
              ),
              Center(
                child: ElevatedButton(
                  child: const Text("Pay"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.cyan,
                  ),
                  onPressed: ()
                  {
                    initiateTransaction(app,widget.model!.upi!,widget.model!.sellerName!);
                  },
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
