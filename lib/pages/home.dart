import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_aug/constants/colors.dart';
import 'package:flutter_test_aug/model/category_model.dart';
import 'package:flutter_test_aug/pages/cart_page.dart';
import 'package:flutter_test_aug/pages/product_page.dart';
import 'package:flutter_test_aug/provider/cart_provider.dart';
import 'package:flutter_test_aug/widgets/custom_carousel_widget.dart';
import 'package:flutter_test_aug/widgets/search_text_field.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  final bannerItems = [
    'asset/images/airpod-sale.jpg',
    'asset/images/discount-product.jpg',
    'asset/images/shoe-sale-banner-vector.jpg'
  ];

  final categoryItems = [
    CategoryModel(title: "Shoe", path: "asset/images/shoe.jpg"),
    CategoryModel(title: "Beauty", path: "asset/images/lipstick.jpg"),
    CategoryModel(title: "Women's\nFashion", path: "asset/images/female.jpg"),
    CategoryModel(title: "jewelry", path: "asset/images/jewellery.jpg"),
    CategoryModel(
        title: "  Men's\nFashion", path: "asset/images/jewellery.jpg"),
    CategoryModel(title: "Gadgets", path: "asset/images/gadget.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: bottomNavBackground,
          appBar: PreferredSize(
              preferredSize: Size(double.infinity, size.height * 0.7),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Consumer<CartProvider>(
                    builder: (context, value, child) {
                      return SizedBox(
                        height: size.height * 0.07,
                        child: Row(
                          children: [
                            const AppBarIcon(
                              icon: Icons.menu,
                            ),
                            const Spacer(),
                            Stack(children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => const Cartpage(),
                                    ));
                                  },
                                  child: const AppBarIcon(
                                      icon: Icons.shopping_cart)),
                              if (value.cart.isNotEmpty)
                                Positioned(
                                  right: 0,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red.shade400,
                                    radius: 10,
                                    child: Text(
                                      value.cart.length.toString(),
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                  ),
                                ),
                            ])
                          ],
                        ),
                      );
                    },
                  ))),
          body: Consumer<CartProvider>(
            builder: (context, value, child) {
              return ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: SearchTextField(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomCarouselSliderWidget(bannerItems: bannerItems),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SizedBox(
                      height: 90,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryItems.length,
                        itemBuilder: (context, index) {
                          final data = categoryItems[index];
                          return CircularCategoryWidget(
                            title: data.title,
                            imagePath: data.path,
                          );
                        },
                      ),
                    ),
                  ),
                  if (kIsWeb)
                    const SizedBox(
                      height: 30,
                    ),
                  const ListTile(
                    title: Text(
                      "Special For You",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      "see all",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SpecialProductWidget(
                        model: value.allProductsList[0],
                        size: size,
                      ),
                      SpecialProductWidget(
                        model: value.allProductsList[1],
                        size: size,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SpecialProductWidget(
                        model: value.allProductsList[2],
                        size: size,
                      ),
                      SpecialProductWidget(
                        model: value.allProductsList[3],
                        size: size,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SpecialProductWidget(
                        model: value.allProductsList[4],
                        size: size,
                      ),
                      SpecialProductWidget(
                        model: value.allProductsList[5],
                        size: size,
                      )
                    ],
                  ),
                ],
              );
            },
          )),
    );
  }
}

class SpecialProductWidget extends StatelessWidget {
  final ProductModel model;

  const SpecialProductWidget({
    super.key,
    required this.size,
    required this.model,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductPage(
            description: model.description,
            model: model,
          ),
        ));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: specialWidgetBackground,
          width: size.width * 0.45,
          height: 165,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(model.imagepath))),
                  width: size.width * 0.45,
                  height: 110,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: size.width * 0.45,
                  height: 55,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.title,
                          style: const TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rs ${model.price.toString()}",
                                style: const TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.bold),
                              ),
                              const Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 8,
                                    child: Center(
                                      child: CircleAvatar(
                                        radius: 5,
                                        backgroundColor: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  CircleAvatar(
                                    radius: 8,
                                    backgroundColor: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  CircleAvatar(
                                    radius: 8,
                                    backgroundColor: Colors.orange,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  MoreColorWidget()
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MoreColorWidget extends StatelessWidget {
  const MoreColorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 8,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey.shade400,
            width: 2.0,
          ),
        ),
        child: const CircleAvatar(
          radius: 6,
          backgroundColor: Colors.transparent,
          child: SizedBox(
            height: 12,
            width: 12,
            child: Center(
                child: Text(
              textAlign: TextAlign.center,
              "+2",
              style: TextStyle(fontSize: 8),
            )),
          ),
        ),
      ),
    );
  }
}

class CircularCategoryWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  const CircularCategoryWidget({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: 60,
      child: Wrap(children: [
        CircleAvatar(
          backgroundImage: AssetImage(
            imagePath,
          ),
          radius: 28,
        ),
        Center(
          child: Text(
            textAlign: TextAlign.justify,
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        )
      ]),
    );
  }
}

class AppBarIcon extends StatelessWidget {
  final IconData icon;
  const AppBarIcon({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: appBarIconColor,
      radius: 23,
      child: Icon(icon),
    );
  }
}
