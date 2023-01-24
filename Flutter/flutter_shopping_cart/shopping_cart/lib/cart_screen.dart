import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/items.dart';
import 'package:shopping_cart/order_summary.dart';

import 'cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  calculateTotal() {
    double total = 0;
    double price = 0;
    int quantity = 0;

    for (int i = 0; i < cartProductName.length; i++) {
      price = double.parse(cartProductPrice[i]);
      quantity = int.parse(cartQuantity[i]);
      total = total + (price * quantity);
    }

    return total;
  }

  deleteTotal(int index, double total) {
    double price = double.parse(cartProductPrice[index]);
    int quantity = int.parse(cartQuantity[index]);
    total = total - (quantity * price);
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
        // actions: [
        //   Center(
        //     child: Icon(Icons.shopping_bag_outlined),
        //   ),
        //   SizedBox(
        //     width: 20,
        //   )
        // ],
      ),
      body: (cartProductName.length != 0)
          ? (Column(children: [
              Expanded(
                child: ListView.builder(
                    itemCount: cartProductName.length,
                    itemBuilder: ((context, index) {
                      return Stack(children: [
                        Card(
                          elevation: 2.0,
                          child: ListTile(
                            title: Text(cartProductName[index].toString()),
                            subtitle: Text(cartProductPrice[index].toString()),
                            leading: Image.network(
                                cartProductImage[index].toString()),
                            trailing: _TrailingWidget(index),
                          ),
                        ),
                        Positioned(
                          top: 7,
                          right: 10,
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  cart.removeCartProductName(index);
                                  cart.removeCartProductPrice(index);
                                  cart.removeCartProductImage(index);
                                  cart.removeCartQuantity(index);
                                  cart.removeCounter();
                                  productAdded[
                                      int.parse(cartProductIndex[index])]=false;
                                  cart.removeProductIndex(index);
                                 
                                });
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.deepPurple,
                              )),
                        )
                      ]);
                    })),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Total:",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.w600),
                            )),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Rs.${calculateTotal().toString()}",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w400),
                          )),
                      SizedBox(
                        width: 100,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => OrderSummary())));
                          },
                          child: Text("Prooced"))
                    ],
                  ),
                ),
              )
            ]))
          : (Center(
              child: Image.asset(
                "assets/images/cart.png",
                scale: 0.7,
              ),
            )),
    );
  }

  Widget _TrailingWidget(int index) {
    return FittedBox(
      child: Row(children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            setState(() {
              int.parse(cartQuantity[index]) != 1
                  ? cartQuantity[index] =
                      (int.parse(cartQuantity[index]) - 1).toString()
                  : int.parse(cartQuantity[index]);
            });
          },
        ),
        Text(cartQuantity[index]),
        IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                cartQuantity[index] =
                    (int.parse(cartQuantity[index]) + 1).toString();
              });
            }),
      ]),
    );
  }
}
