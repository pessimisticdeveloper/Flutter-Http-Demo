import 'package:flutter/material.dart';
import 'package:http_demo/models/product.dart';

class ProductListRowWidget extends StatelessWidget {
  Product product;
  ProductListRowWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return buildProductItemCard(context);
  }

  buildProductItemCard(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(
          children: [
            Container(
              child: Icon(
                Icons.star,
                size: 100,
              ),
              height: 130.0,
              width: MediaQuery.of(context).size.width / 2,
            ),
            Text(product.productName!),
            Text(
              "${product.unitPrice.toString()} TL",
              style: TextStyle(fontSize: 18, color: Colors.redAccent),
            ),
          ],
        ),
      ),
    );
  }
}
