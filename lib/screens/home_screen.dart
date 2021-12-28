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
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
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
                IconButton(
                  icon: const Icon(Icons.add_shopping_cart, color: Colors.white,),
                  onPressed: (){},
                ),
              ],
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
