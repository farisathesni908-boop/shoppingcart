import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shoppingcart2/cartProvider.dart';
import 'package:shoppingcart2/constants.dart';


class Cartscreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    title: Text('Cart',style: TextStyle(
      color: Colors.white
    ),),
    centerTitle: true,
    backgroundColor: primarycolor,

  ),
  body: Consumer<CartProvider>(builder: (context, cart, child) {
    
  
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cart.cartItems.length,
            itemBuilder: (context,index){
              final item=cart. cartItems[index];
            return ListTile(
              leading: Container(
                height: 50,
                width: 50,
                color: item.color,
              ),
              title: Text(item.name),
                      subtitle: Text("\$${item.price}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          cart.removeFromCart(item);
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Total: \$${cart.totalPrice}",
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
            
          
  