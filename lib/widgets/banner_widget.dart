import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_revile/services/firebase_service.dart';
import 'package:getwidget/getwidget.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final FirebaseService _service = FirebaseService();
  double scrollPosition = 0;
  final List _bannerImage = [];

  @override
  void initState() {
    getBannerData();
    super.initState();
  }

  getBannerData(){
    return _service.homebanner.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          _bannerImage.add(doc['image']);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 140,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade200,
              child: PageView.builder(
                itemCount: _bannerImage.length,
                itemBuilder: (BuildContext context, int index){
                  return CachedNetworkImage(
                    imageUrl: _bannerImage[index],
                    fit: BoxFit.cover,
                    placeholder: (context, url) => GFShimmer(
                        showShimmerEffect: true,
                        mainColor: Colors.grey.shade500,
                        secondaryColor: Colors.grey.shade300,
                        child: Container(color: Colors.grey.shade300,)
                    ),
                  );
                },
                onPageChanged: (val){
                  setState(() {
                    scrollPosition = val.toDouble();
                  });
                },
              ),
            ),
          ),
        ),
        _bannerImage.isEmpty ? Container() :
        DotsIndWidget(
          scrollPosition: scrollPosition,
          listItem: _bannerImage,
        ),
      ],
    );
  }
}

class DotsIndWidget extends StatelessWidget {
  const DotsIndWidget({Key? key, required this.scrollPosition, required this.listItem}) : super(key: key);
  final double scrollPosition;
  final List listItem;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15.0,
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: DotsIndicator(
              position: scrollPosition,
              dotsCount: listItem.length,
              decorator: DotsDecorator(
                spacing: const EdgeInsets.all(2),
                size: const Size.square(6),
                activeSize: const Size(12,6),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
