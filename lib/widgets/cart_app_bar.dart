import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_aug/constants/colors.dart';
import 'package:flutter_test_aug/provider/cart_provider.dart';
import 'package:provider/provider.dart';

PreferredSize cartAppBar(
    {required Size size,
    required BuildContext context,
    String? title,
    bool isProductPage = false}) {
  return PreferredSize(
    preferredSize: Size(double.infinity, size.height * 0.7),
    child: Container(
      color: appBarIconColor,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Consumer<CartProvider>(
            builder: (context, value, child) {
              return SizedBox(
                  height: size.height * 0.07,
                  width: double.infinity,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          value.clearTotalPrice();
                          Navigator.pop(context);
                        },
                        child: const Card(
                          color: appBarIconColor,
                          shape: CircleBorder(),
                          child: CircleAvatar(
                            backgroundColor: appBarIconColor,
                            radius: 23,
                            child: Icon(
                              CupertinoIcons.left_chevron,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      if (!isProductPage)
                        SizedBox(
                          width: size.width * 0.25,
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          isProductPage ? title! : "My Cart",
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ));
            },
          )),
    ),
  );
}
