import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_aug/constants/colors.dart';
import 'package:flutter_test_aug/pages/search_page.dart';
import 'package:flutter_test_aug/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class SearchTextField extends StatefulWidget {
  final bool isSearchpage;
  const SearchTextField({super.key, this.isSearchpage = false});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!widget.isSearchpage) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const SearchPage(),
          ));
        }
      },
      child: TextField(
        onSubmitted: (value) {
          if (value != '') {
            final prov = Provider.of<CartProvider>(context, listen: false);
            prov.searchForProducts(_searchController.text);
          }
        },
        controller: _searchController,
        enabled: widget.isSearchpage,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            prefixIcon: const Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
            suffixIcon: Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              decoration: const BoxDecoration(
                border: Border(left: BorderSide(color: Colors.grey)),
              ),
              child: const Icon(Icons.sort),
            ),
            hintText: 'Search..',
            hintStyle: const TextStyle(color: Colors.grey),
            fillColor: searchFieldFilledColor,
            filled: true,
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: searchFieldFilledColor),
              borderRadius: BorderRadius.circular(30),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: searchFieldFilledColor),
              borderRadius: BorderRadius.circular(30),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: searchFieldFilledColor),
              borderRadius: BorderRadius.circular(30),
            )),
      ),
    );
  }
}
