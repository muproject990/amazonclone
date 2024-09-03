import 'package:ecommerce_android_app/common/widgets/loader.dart';
import 'package:ecommerce_android_app/constants/globalvaariables.dart';
import 'package:ecommerce_android_app/features/accounts/widgets/single_product.dart';
import 'package:ecommerce_android_app/features/admin/screens/add_product_screen.dart';
import 'package:ecommerce_android_app/features/admin/services/admin_services.dart';
import 'package:ecommerce_android_app/models/product.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Product>? products;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllProducts(context);
  }

  fetchAllProducts(context) async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  void navigatetoAddProduct() {
    Navigator.pushNamed(
      context,
      AddProductScreen.routeName,
    );
  }

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
        context: context,
        product: product,
        onSuccess: () {
          // todo: remove
          products!.removeAt(index);
          setState(() {});
        });
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: AppBar(
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    gradient: GlobalVariables.appBarGradient,
                  ),
                ),
              ),
            ),
            body: GridView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: products!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  final productData = products![index];
                  return Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.1,
                        height: 140,
                        child: SingleProduct(
                          image: productData.images[0],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Container(
                              child: Text(
                                productData.name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () =>
                                  deleteProduct(productData, index),
                              icon: const Icon(Icons.delete_outline))
                        ],
                      )
                    ],
                  );
                }),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.teal,
              onPressed: navigatetoAddProduct,
              child: const Icon(
                Icons.add,
              ),
            ),
          );
  }
}
