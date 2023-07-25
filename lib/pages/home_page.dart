import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceries_shop_app/model/cart_model.dart';
import 'package:provider/provider.dart';
import '../components/groceries_items.dart';
import 'cart_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(Icons.shopping_bag),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) {
              return CartPage();
            }
          )
        )
      ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 45),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text('Good Morning'),
            ),

            const SizedBox(height: 4),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text('Lets Order Fresh Items for You',
                style: GoogleFonts.notoSerif(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Divider(
                thickness: 4,
              ),
            ),

            const SizedBox(height: 24),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text('Fresh Items',
                style: TextStyle(fontSize: 16),
              ),
            ),

            Expanded(
              child:Consumer<CartModel> (
                builder: (context, value, child){
                  return  GridView.builder(
                    itemCount: value.shopItems.length,
                    padding: EdgeInsets.all(12),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // this makes it looks like a rectangle, default is  square 
                      childAspectRatio: 1 / 1.3,
                      ),
                      itemBuilder: (context, index) {
                        return GroseriesItemTile(
                          itemName: value.shopItems[index][0],
                          itemPrice: value.shopItems[index][1],
                          imagePath: value.shopItems[index][2],
                          color: value.shopItems[index][3],
                          onPressed: () {
                            Provider.of<CartModel>(
                              context,
                              listen: false
                            )
                            .addItemstoCart(index);
                          },
                        );
                      }
                  );
                }
              )
            )
          ],
        ),
      ),
    );
  }
}