
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shoppingcart2/Cartscreen.dart';
import 'package:shoppingcart2/ItemModel.dart';

import 'package:shoppingcart2/cartProvider.dart';
import 'package:shoppingcart2/constants.dart';

class Catelogscreen extends StatelessWidget {
  Catelogscreen({super.key});
  final List<item> Catalog = [
    item(name: "mobile", price: 20000, color: Colors.green),
    item(name: "laptop", price: 60000, color: Colors.red),
    item(name: "Ac", price: 40000, color: Colors.grey),
    item(name: "bag", price: 500, color: Colors.pink),
    item(name: "basket", price: 200, color: Colors.blue),
    item(name: "bottle", price: 100, color: Colors.green),
    item(name: "notebook", price: 150, color: Colors.teal),
    item(name: "flower", price: 550, color: Colors.yellow),
    item(name: "tv", price: 80000, color: Colors.black),
  ];

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        title: Text('Catalog', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Cartscreen()),
              );
            },
                child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(Icons.shopping_cart, size: 30, color: Colors.white),

                  /// 🔴 Badge
                  if (cart.cartItems.isNotEmpty)
                    Positioned(
                      right: -6,
                      top: -6,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,

                        ),
                        child: Text(
                          cart.cartcount.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ),
                    )
                ],
              ),
            ),
            SizedBox(width: 15),

              ]
          ),
        
      

      body: ListView.builder(
        itemCount: Catalog.length,
        itemBuilder: (context, index) {
          final item = Catalog[index];
          return ListTile(
            leading: Container(height: 50, width: 50, color: item.color),
            title: Text(item.name),
            subtitle: Text('/${item.price}'),
            trailing: Container(
              height: 50,
              width: 200,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primarycolor,
                    ),
                    onPressed: () {
                      cart.addToCart(item);
                    },
                    child: Text('Add', style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primarycolor,
                    ),
                    onPressed: () {
                      cart.removeFromCart(item);
                    },
                    child: Text('sub', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          );
        },
      )
    );
      
  
    
    
  }
}
