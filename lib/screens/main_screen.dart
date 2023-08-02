import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http_demo/data/api/product_api.dart';
import 'package:http_demo/models/category.dart';
import 'package:http_demo/widgets/product_list_widget.dart';
import '../data/api/category_api.dart';
import '../models/product.dart';

class MainScreen extends StatefulWidget {
  @override
  MainScreenState createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State {
  List<Category> categories = [];
  List<Widget> categoryWidgets = [];
  List<Product> products = [];

  @override
  void initState() {
    getCategoriesFromApi();
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cat's Way",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryWidgets,
              ),
            ),
            ProductListWidget(products),
          ],
        ),
      ),
    );
  }

  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.categories =
            list.map((category) => Category.fromJson(category)).toList();
        getCategoryWidgets();
      });
    });
  }

  List<Widget> getCategoryWidgets() {
    for (int i = 0; i < categories.length; i++) {
      categoryWidgets.add(getCategoryWidget(categories[i]));
    }
    return categoryWidgets;
  }

  Widget getCategoryWidget(Category category) {
    return TextButton(
      onPressed: () {
        getProductsByCategoryId(category);
      },
      child: Text(
        category.categoryName,
        style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
      ),
    );
  }

  void getProductsByCategoryId(Category category) {
    ProductApi.getProductsByCategoryId(category.id).then((response) => {
          setState(() {
            Iterable list = json.decode(response.body);
            this.products =
                list.map((product) => Product.fromJson(product)).toList();
          }),
        });
  }
  void getProducts() {
    ProductApi.getProducts().then((response) => {
      setState(() {
        Iterable list = json.decode(response.body);
        this.products =
            list.map((product) => Product.fromJson(product)).toList();
      }),
    });
  }
}
