import 'package:flutter/material.dart';
import 'package:flutter_test_aug/constants/colors.dart';
import 'package:flutter_test_aug/model/category_model.dart';
import 'package:flutter_test_aug/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CustomCartItemWidget extends StatelessWidget {
  final ProductModel product;
  final int index;
  final String price;
  const CustomCartItemWidget({
    super.key,
    required this.product,
    required this.index,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1),
          child: Card(
            elevation: 2,
            surfaceTintColor: Colors.transparent,
            color: Colors.white,
            child: SizedBox(
              height: 120,
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: cartPageprimary,
                          borderRadius: BorderRadius.circular(12)),
                      height: 80,
                      width: 80,
                      child: Image(image: AssetImage(product.imagepath)),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    product.title,
                                    style: const TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      value.removeFromCart(
                                          index: index, title: product.title);
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      color: checkoutButtonColor,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                price,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Card(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: cartPageprimary,
                                      borderRadius: BorderRadius.circular(20)),
                                  height: 30,
                                  width: 90,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          value.reduceProductCount(
                                              title: product.title,
                                              index: index);
                                        },
                                        child: const Text(
                                          '\u2014',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        value.cart[index].productCount
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          value.addproductCount(index: index);
                                        },
                                        child: const Text(
                                          "+",
                                          style: TextStyle(
                                              fontSize: 23,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
