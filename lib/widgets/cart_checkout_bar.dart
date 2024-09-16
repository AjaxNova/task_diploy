import 'package:flutter/material.dart';
import 'package:flutter_test_aug/constants/colors.dart';
import 'package:flutter_test_aug/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CheckOutBottomBar extends StatelessWidget {
  const CheckOutBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.27,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                30,
              ),
              topRight: Radius.circular(
                30,
              )),
        ),
        child: Consumer<CartProvider>(
          builder: (context, value, child) {
            return Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Subtotal",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      Text(
                        'Rs. ${value.totalCartPrice.toString()}',
                        style: const TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                  child: Divider(
                    height: 20,
                    thickness: .5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Rs. ${value.totalCartPrice.toString()}',
                        style: const TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: checkoutButtonColor),
                    child: const Center(
                        child: Text(
                      "CheckOut",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ))
              ],
            );
          },
        ));
  }
}
