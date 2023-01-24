import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping_cart/product_list.dart';

import 'items.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({super.key});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  bool isCheckedCOD = false;

  bool isCheckedPayment = false;

  calculateTotal() {
    double total = 0;
    double price = 0;
    int quantity = 0;

    for (int i = 0; i < cartProductName.length; i++) {
      price = double.parse(cartProductPrice[i]);
      quantity = int.parse(cartQuantity[i]);
      total = total + (price * quantity);
    }
    if (isCheckedCOD == true) {
      total = total + 200;
    }
    if (isCheckedPayment == true) {
      total = total + 50;
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Summary"),
      ),
      body: Column(children: [
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
                      leading:
                          Image.network(cartProductImage[index].toString()),
                      trailing: Text("Quantity: ${cartQuantity[index]}"),
                    ),
                  ),
                ]);
              })),
        ),
        Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 230, 224, 243),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
              )),
          child: CheckboxListTile(
              title: Text(
                "COD +Rs.200",
                style: TextStyle(color: Colors.deepPurple, fontSize: 18),
              ),
              value: isCheckedCOD,
              onChanged: (value) {
                setState(() {
                  isCheckedCOD = value!;
                  if (isCheckedCOD == true) {
                    calculateTotal();
                  }
                });
              }),
        ),
        Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 230, 224, 243),
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(20))),
          child: CheckboxListTile(
              title: Text(
                "Advance Payment +Rs.50",
                style: TextStyle(color: Colors.deepPurple, fontSize: 18),
              ),
              value: isCheckedPayment,
              onChanged: (value) {
                setState(() {
                  isCheckedPayment = value!;
                  if (isCheckedPayment == true) {
                    calculateTotal();
                  }
                });
              }),
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
                  width: 90,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple),
                    onPressed: () {
                      cartProductName.clear();
                      cartProductPrice.clear();
                      cartProductImage.clear();
                      cartQuantity.clear();
                      productAdded.replaceRange(0, productAdded.length, productAdded.map((e) => false));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ProductListScreen())));
                    },
                    child: Text("Checkout"))
              ],
            ),
          ),
        )
      ]),
    );
  }
}
