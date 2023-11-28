// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazapay_v2/constants/imageClass.dart';
import 'package:lazapay_v2/constants/product.dart';
// import 'package:lazapay_v2/constants/imgTitle.dart';
// 

class dashboard_screen extends StatefulWidget {
  const dashboard_screen({super.key});

  @override
  State<dashboard_screen> createState() => _dashboard_screenState();
}

class _dashboard_screenState extends State<dashboard_screen> {


  
  final BottomNavigationBarType _bottomNavType = BottomNavigationBarType.fixed;
  int _selectedIndex = 0;

  var size,height,width;

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size; 
    height = size.height;
    width = size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              shape: BoxShape.circle
            ),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.menu))),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle
              ),
              child: IconButton(onPressed: (){}, icon: Icon(Icons.shopping_bag_outlined))),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Hello",
                    style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 25, fontWeight: FontWeight.w700),),
                Text('Welcome to LazaPay!',style: TextStyle(color: Colors.grey.shade500,) ),
              ],),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Flexible(child: CupertinoSearchTextField(
                  decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(30),),
                )),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle
                  ),
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.mic_sharp),color: Colors.white,)),
              ],),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Text('Choose Brand',style: TextStyle(color:Colors.black, fontSize: 17, fontWeight: FontWeight.w400),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                child: Text('View All',style: TextStyle(color:Colors.grey.shade500,)),
              ),
            ],
            ),
            SizedBox(
        height: height/12,
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: myBrands.length,
          itemBuilder: (BuildContext context, int index) => 
            Card(
                child: Container(
                  color: Colors.white,
                  child: Row(children: [
                    Container(
                      // height: 200 ,
                width: 50,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                      color:Colors.white,
                      image:  DecorationImage(
                        image: AssetImage(myBrands[index]),
                      ),
                    ),
              ),
                  ]),
                ),
              ),
        ),
      ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Text('New Arrival',style: TextStyle(color:Colors.black, fontSize: 17, fontWeight: FontWeight.w400),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                child: Text('View All',style: TextStyle(color:Colors.grey.shade500,)),
              ),
            ],
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.5,
                    ), 
                    itemBuilder: (context, index) => 
                    Container(color: Colors.blueAccent,
                    )),
              )
                  ),
          ],
        ),
      ),
      

      bottomNavigationBar: BottomNavigationBar(
          items: _navBarItems,
          currentIndex: _selectedIndex,
          selectedItemColor:  Colors.blueAccent,
          unselectedItemColor:  Colors.grey.shade500,
          type: _bottomNavType,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          ),
          
          

    );
  }
}

class itemCard extends StatelessWidget {
  const itemCard({
    required this.product,
    super.key,
  });

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: Container(child: Image.asset(product.image),))
      ],
    );
  }
}

const _navBarItems = [

  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    activeIcon: Icon(Icons.home),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.favorite_outline_rounded),
    activeIcon: Icon(Icons.favorite),
    label: 'Favorites',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.shopping_bag_outlined),
    activeIcon: Icon(Icons.shopping_bag),
    label: 'Cart',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.account_balance_wallet_outlined),
    activeIcon: Icon(Icons.account_balance_wallet_rounded),
    label: 'Checkout',
  ),
];

