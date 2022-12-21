import 'package:flutter/material.dart';
import 'package:product/screen/home/provider/Homeprovider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeProvider? ProviderTrue;
  HomeProvider? ProviderFalse;

  @override
  Widget build(BuildContext context) {
    ProviderTrue = Provider.of<HomeProvider>(context, listen: true);
    ProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Shopping",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ProviderFalse!.check(ProviderFalse!.cartList, context);
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.green,
              size: 30,
            ),
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 230),
        itemCount: ProviderFalse!.shopingList.length,
        itemBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.only(
                top: 30,
                left: 15,
                right: 15,
              ),
              width: 180,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 30,
                        offset: Offset(0, 0))
                  ]),
              child: Stack(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 12),
                      height: 145,
                      width: 145,
                      child: Image.asset(
                        "${ProviderTrue!.shopingList[index].image}",
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 21, top: 135),
                    child: Text(
                      "${ProviderTrue!.shopingList[index].name}",
                      style: TextStyle(color: Colors.black, fontSize: 23),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 21, top: 170),
                    child: Text(
                      "U\$ ${ProviderTrue!.shopingList[index].price}",
                      style: TextStyle(color: Colors.green, fontSize: 23),
                    ),
                  ),
                  Container(
                    height: 37,
                    width: 40,
                    margin: const EdgeInsets.only(left: 130, top: 163),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12))),
                    alignment: Alignment.center,
                    child: InkWell(
                        onTap: () {
                          ProviderFalse!.h1 = ProviderTrue!.shopingList[index];
                          Navigator.pushNamed(context, 'Data');
                        },
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                          size: 25,
                        )),
                  )
                ],
              ));
        },
      ),
    ));
  }
}
