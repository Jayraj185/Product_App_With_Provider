import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:product/screen/home/modal/HomeModal.dart';

class HomeProvider extends ChangeNotifier {
  List<HomeModal> cartList = [];
  List<HomeModal> shopingList = [
    HomeModal(
        image: "assets/image/apple.png",
        name: "Apple",
        TotalPrice: 9.36,
        price: 9.36,
        quantity: 1,
        data: "Apples are an incredibly nutritious fruit that offers multiple health benefits. They're rich in fiber and antioxidants. Eating them is linked to a lower risk of many chronic conditions, including diabetes, heart disease, and cancer. Apples may also promote weight loss and improve gut and brain health.",
    ),
    HomeModal(
        image: "assets/image/banana.png",
        name: "Banana",
        TotalPrice: 6.24,
        price: 6.24,
        quantity: 1,
        data: "Bananas are rich in vitamins, minerals, fibre and simple sugar. They contain no fat. Bananas are a rich source of vitamin B6, vitamin A, folate, vitamin C, fibres, magnesium, potassium and carbohydrates.",
    ),
    HomeModal(
        image: "assets/image/broccoli.png",
        name: "Broccoli",
        price: 3.20,
        TotalPrice: 3.20,
        quantity: 1,
        data: "Broccoli is a great source of antioxidants and may enhance your health by reducing inflammation, improving blood sugar control, boosting immunity, and promoting heart health. Why Is Broccoli a Superfood? fiber, vitamin C, vitamin K, iron, and potassium."
    ),
    HomeModal(
        image: "assets/image/carrot.png",
        name: "Carrot",
        price: 1.50,
        TotalPrice: 1.50,
        quantity: 1,
        data: "They're rich in beta-carotene, a compound your body changes into vitamin A, which helps keep your eyes healthy. And beta-carotene helps protect your eyes from the sun and lowers your chances of cataracts and other eye problems. Yellow carrots have lutein, which is also good for your eyes.",
    ),
    HomeModal(
      image: "assets/image/kiwi.png",
      name: "Kiwi",
      price: 16.67,
      quantity: 1,
      TotalPrice: 16.67,
      data: "Kiwis are high in Vitamin C and dietary fiber and provide a variety of health benefits. This tart fruit can support heart health, digestive health, and immunity. The kiwi is a healthy choice of fruit and is rich with vitamins and antioxidants.",
    ),
    HomeModal(
      image: "assets/image/orange.png",
      name: "Orange",
      price: 3.84,
      TotalPrice: 3.84,
      quantity: 1,
      data: "Oranges are an excellent source of vitamin C. One orange offers 116.2 per cent of the daily value for vitamin C. Good intake of vitamin C is associated with a reduced risk of colon cancer as it helps to get of free radicals that cause damage to our DNA.",
    ),
    HomeModal(
        image: "assets/image/peppers.png",
        name: "Peppers",
        price: 13.80,
        TotalPrice: 13.80,
        quantity: 1,
        data: "Pepper is an antioxidant that provides anti-inflammatory and antimicrobial effects, among other health benefits. It may also boost brain function and increase levels of good cholesterol.",
    ),
    HomeModal(
        image: "assets/image/strawberry.png",
        name: "Strawberry",
        price: 18.90,
        TotalPrice: 18.90,
        quantity: 1,
        data: "A strawberry is actually a multiple fruit which consists of many tiny individual fruits embedded in a fleshy receptacle. The brownish or whitish specks, which are commonly considered seeds, are the true fruits, called achenes, and each of them surrounds a tiny seed.",
    ),
    HomeModal(
        image: "assets/image/watermelon.png",
        name: "Watermelon",
        price: 18.57,
        quantity: 1,
        TotalPrice: 18.57,
        data: "It has a very high water content and provides nutrients like lycopene,citrulline, and vitamins A and C.Studies suggest that this sweet, redmelon may even boost heart health, reduce muscle soreness, and decreaseinflammation, though more research is needed.",
    ),
  ];
  HomeModal? h1;
  void adddata(HomeModal h1)
  {
    cartList.add(h1);
    notifyListeners();
  }
  void AddQ(HomeModal h1,index)
  {
    cartList[index] = HomeModal(data: h1.data,name: h1.name,price: h1.price,image: h1.image,quantity: h1.quantity! + 1,TotalPrice: h1.TotalPrice);
    notifyListeners();
  }
  void RemoveQ(HomeModal h1,index)
  {
    cartList[index] = HomeModal(data: h1.data,name: h1.name,price: h1.price,image: h1.image,quantity: h1.quantity! - 1,TotalPrice: h1.TotalPrice);
    notifyListeners();
  }
  void delete(index)
  {
    print(index);
    cartList.removeAt(index);
    notifyListeners();
  }
  void check(List cart,BuildContext context)
  {
    if(cart.isEmpty)
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Add Your Product")));
      }
    else
      {
        Total();
        Navigator.pushNamed(context, 'Cart');
      }
    notifyListeners();
  }
  void Multi(HomeModal h1,index)
  {
    cartList[index] = HomeModal(data: h1.data,name: h1.name,TotalPrice: h1.price! * double.parse("${h1.quantity}"),price: h1.price,image: h1.image,quantity: h1.quantity,);
    notifyListeners();
  }
  double Total_Answer=0;
  void Total()
  {
    Total_Answer=0;
    for(int j=0; j<=cartList.length-1; j++)
      {
        Total_Answer = Total_Answer + double.parse("${cartList[j].TotalPrice}");
        // print(cartList.length);
      }
    print("${cartList[0].TotalPrice}");
    print("$Total_Answer");
    notifyListeners();
  }
  void TotalMin(index)
  {
    print(index);
    Total_Answer = Total_Answer - double.parse("${cartList[index].TotalPrice}");
    notifyListeners();
  }
}
