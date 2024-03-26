import 'package:ecoomerce_app/components/my_button.dart';
import 'package:ecoomerce_app/models/product.dart';
import 'package:ecoomerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  // remove item from cart method
  void removeItemFromCart(BuildContext context, Product product) {
    // show a dialog to ask user to confirm to remove from cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Bu ürün sepetinizden kaldırılsın mı?"),
        actions: [
          // cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("İptal"),
          ),

          // yes button
          MaterialButton(
            onPressed: () {

              // pop dialog box
              Navigator.pop(context);

              // add to cart
              context.read<Shop>().removeFromCart(product);
            },
            child: Text("Evet"),
          )

          // yes button
        ],
      ),
    );
  }

  // user pressed pay button
  void payButtonPressed(BuildContext context){
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text("Kullanıcı ödemek istiyor! Bu uygulamayı ödeme backendine bağlayın"),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    // get access to the cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Sepetim"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // cart list
          Expanded(
              child: cart.isEmpty
                  ? const Center(child: Text("Sepetiniz Boş..."))
                  : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index){
                      // get individual item in cart
                      final item = cart [index];

                      // return as a cart tile UI
                      return ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.price.toStringAsFixed(2)),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => removeItemFromCart (context, item),

                      ),
                    );

                  },
                ),
           ),

          // pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(onTap: () => payButtonPressed(context), child: Text("Şimdi öde")),
          )

        ],
      ),


    );
  }
}
