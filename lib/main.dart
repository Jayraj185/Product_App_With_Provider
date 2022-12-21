import 'package:flutter/material.dart';
import 'package:product/screen/cart/view/CartPage.dart';
import 'package:product/screen/data/view/DataPage.dart';
import 'package:product/screen/home/provider/Homeprovider.dart';
import 'package:product/screen/home/view/HomePage.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/' : (context) => HomePage(),
          'Data' : (context) => DataPage(),
          'Cart' : (context) => CartPage(),
        },
      ),
    )
  );
}