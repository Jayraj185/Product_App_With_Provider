import 'package:flutter/material.dart';
import 'package:product/screen/home/provider/Homeprovider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  HomeProvider? ProviderTrue;
  HomeProvider? ProviderFalse;
  @override
  Widget build(BuildContext context) {
    ProviderTrue = Provider.of<HomeProvider>(context, listen: true);
    ProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Cart",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context, '/');
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: ProviderFalse!.cartList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(13),
                    child: Container(
                        height: 105,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 30,
                                  offset: Offset(0, 0))
                            ],
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: EdgeInsets.only(top: 12),
                          child: ListTile(
                            leading: Image.asset("${ProviderTrue!.cartList[index].image}",),
                            title: Text(
                              "${ProviderTrue!.cartList[index].name}",
                              style:
                              TextStyle(color: Colors.black, fontSize: 21),
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  "${ProviderTrue!.cartList[index].quantity}x ",
                                  style: TextStyle(color: Colors.black,fontSize: 15),
                                ),
                                Text(
                                  "U\$ ${ProviderTrue!.cartList[index].price!.toStringAsFixed(2)}",
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                            trailing: SizedBox(
                              width: 105,
                              child: Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          if(ProviderFalse!.cartList[index].quantity! > 1)
                                            {
                                              ProviderFalse!.RemoveQ(ProviderFalse!.cartList[index], index);
                                              ProviderFalse!.Multi(ProviderFalse!.cartList[index], index);
                                              ProviderTrue!.Total();
                                              print("${ProviderTrue!.Total_Answer}");
                                            }
                                        });
                                      },
                                      child: Icon(
                                        Icons.remove_outlined,
                                        color: Colors.green,
                                      )),
                                  SizedBox(width: 15,),
                                  InkWell(
                                      onTap: () {
                                        ProviderFalse!.AddQ(ProviderFalse!.cartList[index], index);
                                        ProviderFalse!.Multi(ProviderFalse!.cartList[index], index);
                                        ProviderTrue!.Total();
                                        print("${ProviderTrue!.Total_Answer}");
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.green,
                                      )),
                                  SizedBox(width: 15,),
                                  InkWell(
                                      onTap: () {
                                        ProviderTrue!.TotalMin(index);
                                        ProviderFalse!.delete(index);
                                      },
                                      child: Icon(
                                        Icons.delete_outline,
                                        color: Colors.green,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        )),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5, right: 5, left: 5),
                  child: Text(
                    "U\$ ${ProviderTrue!.Total_Answer!.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 25, color: Colors.green),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 5, top: 5),
                    child: ElevatedButton(
                      onPressed: () {
                        if(ProviderFalse!.cartList.length>0)
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Purchase Succesfully"),
                                shape: StadiumBorder(),
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.all(15),
                              ));
                          Navigator.pop(context, '/');
                          ProviderFalse!.cartList.clear();
                        }
                        else
                        {
                          Navigator.pop(context,'/');
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Add Your Product")));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: Text("Purchase"),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
