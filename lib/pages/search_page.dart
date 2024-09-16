import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_aug/constants/colors.dart';
import 'package:flutter_test_aug/pages/home.dart';
import 'package:flutter_test_aug/provider/cart_provider.dart';
import 'package:flutter_test_aug/widgets/search_text_field.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Consumer<CartProvider>(
        builder: (context, value, child) {
          return PopScope(
            canPop: true,
            onPopInvoked: (didPop) {
              value.clearSearch();
            },
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size(double.infinity, size.height * 0.7),
                child: SizedBox(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: Consumer<CartProvider>(
                        builder: (context, value, child) {
                          return SizedBox(
                              height: size.height * 0.07,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      value.clearSearch();
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
                                  const Expanded(
                                      child: SearchTextField(
                                    isSearchpage: true,
                                  ))
                                ],
                              ));
                        },
                      )),
                ),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  value.searchResult.isEmpty
                      ? const Center(
                          child: Text("No result Found"),
                        )
                      : Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: GridView.builder(
                              itemCount: value.searchResult.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                final val = value.searchResult[index];
                                return SpecialProductWidget(
                                  size: size,
                                  model: val,
                                );
                              },
                            ),
                          ),
                        )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
