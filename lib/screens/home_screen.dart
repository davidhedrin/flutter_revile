import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_revile/widgets/banner_widget.dart';
import 'package:flutter_revile/widgets/category_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white12,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(45),
            child: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              title: const Text('Revile App'),
              actions: [
                IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: (){},
                ),
              ],
            ),
          ),
        body: ListView(
          children: const [
            SearchWidget(),
            SizedBox(height: 8,),
            BannerWidget(),
            CategoryScreen(),
          ],
        )
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Temukan...",
                hintStyle: const TextStyle(color: Colors.grey),
                contentPadding: const EdgeInsets.all(8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(IconlyBroken.search, size: 20,)
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: const [
                  Icon(IconlyLight.shieldDone, color: Colors.white, size: 13,),
                  Text(' 100% Clean', style: TextStyle(color: Colors.white, fontSize: 12),),
                ],
              ),
              Row(
                children: const [
                  Icon(IconlyLight.timeCircle, color: Colors.white, size: 13,),
                  Text(' Respon Cepat', style: TextStyle(color: Colors.white, fontSize: 12),),
                ],
              ),
              Row(
                children: const [
                  Icon(IconlyLight.unlock, color: Colors.white, size: 13,),
                  Text(' 24x7 Jam', style: TextStyle(color: Colors.white, fontSize: 12),),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
