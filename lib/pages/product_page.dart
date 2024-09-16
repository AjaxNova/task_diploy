// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_test_aug/constants/colors.dart';
import 'package:flutter_test_aug/model/category_model.dart';
import 'package:flutter_test_aug/provider/cart_provider.dart';
import 'package:flutter_test_aug/widgets/cart_app_bar.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  final ProductModel model;
  final String description;
  const ProductPage({
    super.key,
    required this.model,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(child: Consumer<CartProvider>(
      builder: (context, value, child) {
        return Scaffold(
          bottomNavigationBar: SizedBox(
            height: size.height * 0.10,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Card(
                        child: Container(
                          decoration: BoxDecoration(
                              color: cartPageprimary,
                              borderRadius: BorderRadius.circular(20)),
                          height: 40,
                          width: 110,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  value.decrementProductCount();
                                },
                                child: const Text(
                                  '\u2014',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                value.currentProductCartCount.toString(),
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () {
                                  value.increaseProductCount();
                                },
                                child: const Text(
                                  "+",
                                  style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (value.cartMap.containsKey(model.title)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.grey,
                                content: Text("product already in cart")),
                          );
                        } else {
                          model.productCount = value.currentProductCartCount;
                          value.addProductToModel(product: model);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.green,
                                content: Text(
                                    "${model.productCount} ${model.title} added to cart")),
                          );
                          value.clearTheCount();

                          Navigator.of(context).pop();
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: checkoutButtonColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 30.0,
                          ),
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            ),
          ),
          appBar: cartAppBar(
              size: size,
              context: context,
              isProductPage: true,
              title: model.title),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.4,
                  width: double.infinity,
                  child: Container(
                      decoration: const BoxDecoration(color: appBarIconColor),
                      child: Image(image: AssetImage(model.imagepath))),
                ),
                ListTile(
                  title: Text(
                    model.title,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    model.price.toString(),
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                  child: Text(
                    "Description",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    child: Text(
                      description,
                      style: const TextStyle(),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    ));
  }
}
