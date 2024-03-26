import 'package:ecoomerce_app/components/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_product_tile.dart';
import '../models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {

    // access product in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Alışveriş Sayfası"),
        actions: [
          // go to cart button 
          IconButton(onPressed: () => Navigator.pushNamed(context, "/cart_page"), icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          const SizedBox(height: 25),
          // shop subtitle
          Center(
            child: Text(
                "Seçilmiş premium ürünler listesinden seçim yapın",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary),

            ),
          ),

          // Product List

          SizedBox(
            height: 550,
            child : ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(15),
                itemBuilder: (context,index) {
                  // get each individual product from shop
                  final product = products[index];

                  // return as a product tile UI
                  return MyProductTile(product: product);

                }
            ),
          ),
        ],
      )
    );
  }
}
