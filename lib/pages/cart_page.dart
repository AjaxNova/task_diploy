import 'package:flutter/material.dart';
import 'package:flutter_test_aug/constants/colors.dart';
import 'package:flutter_test_aug/provider/cart_provider.dart';
import 'package:flutter_test_aug/widgets/cart_app_bar.dart';
import 'package:flutter_test_aug/widgets/cart_checkout_bar.dart';
import 'package:flutter_test_aug/widgets/custom_cart_widget.dart';
import 'package:provider/provider.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  @override
  void initState() {
    Provider.of<CartProvider>(context, listen: false).calcualteCartPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(child: Consumer<CartProvider>(
      builder: (context, value, child) {
        return PopScope(
          canPop: true,
          onPopInvoked: (didPop) {
            value.clearTotalPrice();
          },
          child: Scaffold(
            bottomNavigationBar: value.cart.isEmpty
                ? const SizedBox()
                : const CheckOutBottomBar(),
            backgroundColor: cartPageScaffoldColor,
            appBar: cartAppBar(size: size, context: context),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                value.cart.isEmpty
                    ? const Center(
                        child: Text("Add products"),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: value.cart.length,
                          itemBuilder: (context, index) {
                            final product = value.cart[index];
                            return CustomCartItemWidget(
                              price: product.price.toString(),
                              product: product,
                              index: index,
                            );
                          },
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
