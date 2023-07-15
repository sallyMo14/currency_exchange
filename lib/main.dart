import 'package:currency_exchange/constants/constants.dart';
import 'package:currency_exchange/widgets/lower_currency_card.dart';
import 'package:currency_exchange/widgets/upper_currency_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  late TextEditingController _currencyController;
  @override
  void initState() {
    _currencyController=TextEditingController();
    super.initState();
  }

  void dispose() {
    _currencyController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UpperCurrencyCard(currencyController:_currencyController ,onSubmit: (){},),



                  // decoration: BoxDecoration(color: Colors.amberAccent),
                   LowerCurrencyCard(),//:

                Container(
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(20),color: kContainersColor, ),
                  height: 100,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Exchanging fees : ",style: TextStyle(color: Colors.white,fontSize: 24),),
                      Text("78.1\$",style: TextStyle(color: Colors.white,fontSize: 18),)
                    ],
                  ),
                )
              ],

            ),
          ),
        ),
      ),
    );
  }
}
