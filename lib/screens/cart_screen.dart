import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

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
            backgroundColor: Colors.white10,
            title: const Text('Keranjang'),
            actions: [
              IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: (){},
              ),
            ],
          ),
        ),
        body: Center(
          child: Text('Cart Screen', style: TextStyle(color: Colors.white, fontSize: 25),),
        ),
      ),
    );
  }
}
