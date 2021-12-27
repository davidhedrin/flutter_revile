import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

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
            title: const Text('Account'),
            actions: [
              IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: (){},
              ),
            ],
          ),
        ),
        body: Center(
          child: Text('Account Screen', style: TextStyle(color: Colors.white, fontSize: 25),),
        ),
      ),
    );
  }
}
