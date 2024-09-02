import 'package:ecommerce_android_app/common/widgets/loader.dart';
import 'package:ecommerce_android_app/constants/globalvaariables.dart';
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
    // TODO: implement initState
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
            body: const Center(
              child: Text('Products'),
            ),
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
