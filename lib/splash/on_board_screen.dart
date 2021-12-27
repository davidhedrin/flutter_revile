import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_revile/screens/main_screen.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);
  static const String id = 'onboard-screen';

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final store = GetStorage();
  double scrollerPosition = 0;
  onButtonPressed(context){
    store.write('onBoarding', true);
    return Navigator.pushReplacementNamed(context, MainScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
            ),
          ),
          child: Stack(
            children: [
              PageView(
                onPageChanged: (val){
                  setState(() {
                    scrollerPosition = val.toDouble();
                  });
                },
                children: [
                  OnBoardPage(
                    boardColumn: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Welcome \n To Revile',
                          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10,),
                        Image.asset('assets/images/1.png', width: 220,),
                      ],
                    ),
                  ),
                  OnBoardPage(
                    boardColumn: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/images/2.png', width: 230,),
                        SizedBox(height: 10,),
                        const Text(
                          'Siap Antar Kemana Saja',
                          style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const Text('Dimana anda berada! Akan kami layanin.', style: TextStyle(color: Colors.white, fontSize: 16,),),
                      ],
                    ),
                  ),
                  OnBoardPage(
                    boardColumn: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/images/3.png', width: 220,),
                        SizedBox(height: 10,),
                        const Text(
                          'Revile Berkulitas',
                          style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const Text('Dengan kulitas kebersihan yang terjaga', style: TextStyle(color: Colors.white, fontSize: 16,),),
                      ],
                    ),
                  ),
                  OnBoardPage(
                    boardColumn: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/images/4.png', width: 240,),
                        SizedBox(height: 10,),
                        const Text(
                          'Tunggu Apa Lagi?',
                          style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const Text('Lakukan pesanan dimana pun anda berada!', style: TextStyle(color: Colors.white, fontSize: 16,),),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DotsIndicator(
                      dotsCount: 4,
                      position: scrollerPosition,
                      decorator: const DotsDecorator(
                        activeColor: Colors.white,
                      ),
                    ),
                    scrollerPosition == 3 ? ElevatedButton(
                        child: const Text('Login Now', style: TextStyle(fontSize: 17),),
                        onPressed: (){
                          onButtonPressed(context);
                        },
                    ) : TextButton(
                      child: const Text('SKIP TO APP >>', style: TextStyle(color: Colors.blue, fontSize: 18),),
                      onPressed: (){
                        onButtonPressed(context);
                      },
                    ),
                    const SizedBox(height: 15,),
                  ],
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({Key? key, this.boardColumn}) : super(key: key);
  final Column? boardColumn;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: boardColumn),
    );
  }
}


/*Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.blueGrey[900]
            ),
          ),
        ),*/

