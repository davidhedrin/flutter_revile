import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List<String> _categoryLabel = <String>[
    'Picked For You',
    'Category1',
    'Category2',
    'Category3',
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10.0, top: 8.0, bottom: 5.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Deploy For You', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),)
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0, left: 10.0),
          child: SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _categoryLabel.length,
                    itemBuilder: (BuildContext context, int index){
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ActionChip(
                          padding: EdgeInsets.zero,
                          backgroundColor: _index == index ? Colors.blue.shade900 : Colors.grey,
                          label: Text(
                            _categoryLabel[index],
                            style: TextStyle(
                              fontSize: _index == index ? 13 : 12,
                              color: _index == index ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: (){
                            setState(() {
                              _index = index;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(IconlyLight.arrowDown2, color: Colors.white,),
                  onPressed: (){},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
