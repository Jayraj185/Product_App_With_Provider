import 'package:flutter/material.dart';
import 'package:product/screen/home/modal/HomeModal.dart';
import 'package:product/screen/home/provider/Homeprovider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  HomeProvider? ProviderTrue;
  HomeProvider? ProviderFalse;
  @override
  Widget build(BuildContext context) {
    ProviderTrue = Provider.of<HomeProvider>(context, listen: true);
    ProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("${ProviderTrue!.h1!.name}",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context,'/');
          },
          child: Icon(Icons.arrow_back,color: Colors.black,size: 26,),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Image.asset("${ProviderFalse!.h1!.image}",height: 350,width: 350,),
          ),
          Padding(
            padding: EdgeInsets.only(left: 21,top: 500),
            child: Text(
              "${ProviderFalse!.h1!.name}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 21,top: 545,right: 21),
            child: Text(
              "${ProviderFalse!.h1!.data}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 21,top: 715,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "U\$ ${ProviderFalse!.h1!.price}",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 25,
                  ),
                ),
                FloatingActionButton.extended(
                    onPressed: (){
                      ProviderFalse!.adddata(ProviderTrue!.h1!);
                      Navigator.pop(context,'/');
                    },
                    label: Text("Add To Cart"),
                    icon:Icon(Icons.shopping_cart_outlined),
                    backgroundColor: Colors.green,
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
