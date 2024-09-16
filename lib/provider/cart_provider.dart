import 'package:flutter/material.dart';
import 'package:flutter_test_aug/model/category_model.dart';

class CartProvider extends ChangeNotifier {
  Map<String, dynamic> cartMap = {};

  List<ProductModel> searchResult = [];

  searchForProducts(String query) {
    searchResult = allProductsList.where((item) {
      return item.title.toLowerCase().startsWith(query);
    }).toList();
    notifyListeners();
  }

  clearSearch() {
    searchResult = [];
    notifyListeners();
  }

  final List<ProductModel> allProductsList = [
    ProductModel(
      description:
          "Experience exceptional sound quality and freedom of movement with these wireless headphones. Designed for superior comfort and performance, these headphones deliver crystal-clear audio with deep bass and crisp highs, making your music, podcasts, and calls come to life. With Bluetooth connectivity, you can enjoy a seamless wireless experience, pairing effortlessly with your devices for up to 30 hours of playtime on a single charge. The ergonomic, lightweight design ensures a comfortable fit, even during extended listening sessions. Featuring noise-canceling technology, these headphones block out external distractions, allowing you to focus on your audio wherever you are. Whether you're at home, in the office, or on the go, these wireless headphones offer the perfect combination of style, convenience, and immersive sound.",
      title: 'Wireless Headphone',
      price: 1200,
      imagepath: 'asset/images/headphones-background-design.png',
    ),
    ProductModel(
        title: 'Woman Sweater',
        price: 499,
        imagepath: 'asset/images/sweater_2.png',
        description:
            "Wrap yourself in cozy comfort with this stylish women’s sweater. Crafted from soft, high-quality fabric, it’s designed to keep you warm while maintaining a lightweight feel, perfect for layering on cooler days. The relaxed fit and classic design make it a versatile piece, whether you’re dressing up for a casual day out or lounging at home. Featuring a flattering silhouette with ribbed cuffs and hem, this sweater offers both comfort and elegance. Available in a variety of colors, it pairs effortlessly with jeans, skirts, or leggings, making it a must-have for your wardrobe. Stay warm and chic all season long with this essential women’s sweater."),
    ProductModel(
        description:
            "The Apple Watch Series 8 is the ultimate fitness companion designed for your modern lifestyle. With its sleek and stylish design, this smartwatch offers an always-on Retina display, ensuring you can view notifications, messages, and apps at a glance in any lighting condition. Stay on top of your health with comprehensive tracking features, including heart rate monitoring, blood oxygen measurement, and ECG. Whether you're running, swimming, or practicing yoga, the Apple Watch delivers advanced workout metrics to help you track your performance in detail. With built-in cellular connectivity, you can answer calls, respond to messages, and access your favorite apps, even without your phone nearby. The watch also tracks your sleep patterns to ensure you're getting the rest you need. It’s water-resistant up to 50 meters, making it perfect for swimming and other water activities. With a long battery life lasting up to 18 hours, the Apple Watch Series 8 is built to keep up with your day, helping you stay connected, active, and healthy",
        title: 'Apple Watch',
        price: 42000,
        imagepath: 'asset/images/watch_apple.png'),
    ProductModel(
        description:
            "Elevate your style and protect your eyes with these premium sunglasses. Designed for both fashion and functionality, these sunglasses feature high-quality polarized lenses that provide 100% UV protection, reducing glare and shielding your eyes from harmful sun rays. The lightweight yet durable frame ensures all-day comfort, making them perfect for outdoor activities, driving, or simply lounging in the sun. With a sleek, modern design, these sunglasses are a versatile accessory that complements any outfit, whether casual or formal. Experience a blend of luxury, comfort, and performance with these must-have sunglasses, ideal for anyone looking to make a bold style statement while keeping their eyes safe.",
        title: 'Sunglass',
        price: 2000,
        imagepath: 'asset/images/glasses.png'),
    ProductModel(
        description:
            "Upgrade your everyday wardrobe with this versatile and comfortable T-shirt. Made from soft, breathable fabric, this T-shirt offers a relaxed fit that’s perfect for all-day wear. Its classic crewneck design and short sleeves make it a timeless essential that pairs effortlessly with jeans, shorts, or skirts. Whether you’re dressing it up with a jacket or keeping it casual, this T-shirt is a go-to piece for any occasion. Available in a variety of colors, it’s easy to mix and match, making it a staple in your closet. Stay stylish and comfortable with this must-have T-shirt for every season.",
        title: 'T Shirt',
        price: 290,
        imagepath: 'asset/images/red_tshirt.png'),
    ProductModel(
        description:
            "Step up your game with the Nike shoes, designed for performance, comfort, and style. Engineered with lightweight, breathable materials, these shoes provide exceptional support whether you're hitting the gym, running outdoors, or just out for a casual day. The cushioned midsole delivers superior comfort and shock absorption with every step, while the durable outsole ensures maximum traction and grip on various surfaces. With Nike's signature sleek design, these shoes not only enhance your performance but also elevate your style. Perfect for athletes and everyday wearers alike, these shoes offer the perfect combination of function and fashion, making them a must-have for anyone on the go.",
        title: 'Nike Shoe',
        price: 2499,
        imagepath: 'asset/images/nike_shoe.png'),
  ];

  clearTotalPrice() {
    totalCartPrice = 0;
    notifyListeners();
  }

  int totalCartPrice = 0;

  calcualteCartPrice() {
    for (var element in cart) {
      totalCartPrice =
          totalCartPrice + ((element.productCount) * (element.price));
    }
    // notifyListeners();
  }

  List<ProductModel> cart = [];
  int currentProductCartCount = 1;

  increaseProductCount() {
    currentProductCartCount++;
    notifyListeners();
  }

  decrementProductCount() {
    if (currentProductCartCount != 1) {
      currentProductCartCount--;
      notifyListeners();
    }
  }

  clearTheCount() {
    currentProductCartCount = 1;
    notifyListeners();
  }

  addProductToModel({required ProductModel product}) {
    if (!cartMap.containsKey(product.title)) {
      cartMap[product.title] = "";
      cart.add(product);
      notifyListeners();
    }
  }

  removeFromCart({required int index, required String title}) {
    totalCartPrice =
        totalCartPrice - (cart[index].price * cart[index].productCount);
    cartMap.remove(title);
    cart.removeAt(index);
    notifyListeners();
  }

  addproductCount({required int index}) {
    totalCartPrice = totalCartPrice + cart[index].price;
    cart[index].productCount++;
    notifyListeners();
  }

  reduceProductCount({required int index, required String title}) {
    if (cart[index].productCount == 1) {
      clearTotalPrice();
      cartMap.remove(title);
      cart.removeAt(index);
      notifyListeners();
    } else {
      totalCartPrice = totalCartPrice - cart[index].price;
      cart[index].productCount--;
      notifyListeners();
    }
  }
}
