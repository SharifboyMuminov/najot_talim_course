import 'package:default_project/data/model/product/produc_model.dart';
import 'package:default_project/view/product_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view/categoriy_view.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    var providerListen = Provider.of<ProductViewModel>(context);
    var provider = Provider.of<ProductViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Screen"),
      ),
      body: providerListen.loading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : GridView.builder(
              itemCount: providerListen.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                crossAxisSpacing: 10.0, // Spacing between columns
                mainAxisSpacing: 10.0, // Spacing between rows
                childAspectRatio:
                    0.75, // Ratio of width to height for each grid item
              ),
              itemBuilder: (BuildContext context, int index) {
                ProductModel productModel = providerListen.products[index];
                return Column(
                  children: [
                    Expanded(
                      child: Image.network(productModel.imageUrl),
                    ),
                    Text(productModel.phoneNumber),
                    Text(productModel.price.toString()),
                  ],
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.insertProducts(context,
              productModel: ProductModel(
                categoryId: "6WNwmQ21d3hfHbaFXixe",
                docId: "",
                imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHcve6N1S9bm-kfnkFwUilmxrq6Kp9tK747A&usqp=CAU",
                price: 5000,
                rate: 3.4,
                phoneNumber: "+998913662637",
                gender: 'Universal',
                nameProduct: 'gaiter',
              ));
        },
      ),
    );
  }
}
