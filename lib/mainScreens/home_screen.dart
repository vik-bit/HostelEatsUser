import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:main_project/assistantMethods/assistant_methods.dart';
import 'package:main_project/authentication/auth_screen.dart';
import 'package:main_project/global/global.dart';
import 'package:main_project/models/seller.dart';
import 'package:main_project/widgets/sellers_design.dart';
import 'package:main_project/widgets/my_drawer.dart';
import 'package:main_project/widgets/progress_bar.dart';
import '../models/user_model.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen>
{


  final items = [
    "slider/0.jfif",
    "slider/1.jpg",
    "slider/0.jfif",
    "slider/3.jpg",
    "slider/1.jpg",
    "slider/3.jpg",
    "slider/0.jfif",
    "slider/1.jpg",
    "slider/3.jpg",
    "slider/0.jfif",
    "slider/1.jpg",
    "slider/3.jpg",
    "slider/0.jfif",
    "slider/1.jpg",
    "slider/3.jpg",
    "slider/0.jfif",
    "slider/1.jpg",
    "slider/3.jpg",
    "slider/0.jfif",
    "slider/1.jpg",
    "slider/3.jpg",
    "slider/0.jfif",
    "slider/1.jpg",
    "slider/3.jpg",
    "slider/0.jfif",
    "slider/1.jpg",
    "slider/3.jpg",
    "slider/0.jfif",
  ];

  @override
  void initState() {
    super.initState();

    clearCartNow(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor: Colors.yellow[650],
        title: const Text(
          "HostelEats",
          style: TextStyle(fontSize: 45, fontFamily: "Signatra"),
        ),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: CustomScrollView(

        slivers: [
          SliverToBoxAdapter(

            child: Padding(
              padding: const EdgeInsets.all(10.0),

              child: Container(

                height: MediaQuery.of(context).size.height * .3,
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(

                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * .3,
                    aspectRatio: 16/9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    autoPlayAnimationDuration: const Duration(milliseconds: 500),
                    autoPlayCurve: Curves.decelerate,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: items.map((index) {
                    return Builder(builder: (BuildContext context){
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 1.0),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset(
                            index,
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    });
                  }).toList(),
                ),

              ),

            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("seller")
                .snapshots(),
            builder: (context, snapshot)
            {
              return !snapshot.hasData
                  ? SliverToBoxAdapter(child: Center(child: circularProgress(),),)
                  : SliverStaggeredGrid.countBuilder(
                crossAxisCount: 1,
                staggeredTileBuilder: (c) => StaggeredTile.fit(1),
                itemBuilder: (context, index)
                {
                  Seller sModel = Seller.fromJson(
                      snapshot.data!.docs[index].data()! as Map<String, dynamic>
                  );
                  //design for display sellers-cafes-restuarents
                  return SellersDesignWidget(
                    model: sModel,
                    context: context,
                  );
                },
                itemCount: snapshot.data!.docs.length,
              );
            },
          ),
        ],
      ),
    );
  }
}
