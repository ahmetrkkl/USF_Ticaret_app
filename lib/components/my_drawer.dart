import 'package:ecoomerce_app/components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            //drawer header: logo
            DrawerHeader(
              child: Center(
                child: Icon(
                  Icons.shopping_bag,
                  size: 72,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),

            const SizedBox(height: 25),

            //shop tile
            MyListTile(
              text: "Mağaza",
              icon: Icons.home,
              onTap: () => Navigator.pop(context),
            ),

            //cart tile
            MyListTile(
              text: "Sepet",
              icon: Icons.shopping_cart,
              onTap: () {
                // pop drawer first
                Navigator.pop(context);

                //go to cart page
                Navigator.pushNamed(context, '/cart_page');
                },
              ),
            ],
          ),

          //exit shop tile
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: "Çıkış",
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(context, "/intro_page", (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}
