import 'package:ecommerce_android_app/common/widgets/loader.dart';
import 'package:ecommerce_android_app/constants/globalvaariables.dart';
import 'package:ecommerce_android_app/features/home/widgets/address_box.dart';
import 'package:ecommerce_android_app/features/search/service/search_services.dart';
import 'package:ecommerce_android_app/features/search/widgets/search_product.dart';
import 'package:ecommerce_android_app/models/product.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "search";
  final String query;

  const SearchScreen({super.key, required this.query});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  void navigatetoSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  List<Product>? products;
  final SearchServices searchServices = SearchServices();

  @override
  void initState() {
    super.initState();
    fetchSearchProducts();
  }

  fetchSearchProducts() async {
    products = await searchServices.fetchSearchProducts(
        context: context, query: widget.query);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 42,
                    margin: const EdgeInsets.only(left: 15),
                    child: Material(
                      borderRadius: BorderRadius.circular(7),
                      elevation: 1,
                      child: TextFormField(
                        onFieldSubmitted: navigatetoSearchScreen,
                        decoration: InputDecoration(
                          prefixIcon: InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(
                                  left: 5,
                                ),
                                child: Icon(Icons.search),
                              )),
                          filled: true,
                          fillColor: Colors.white,
                          // ! Hint Text Field
                          hintText: 'Search Books .....',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                          // textInputAction: TextInputAction.search,
                          contentPadding: const EdgeInsets.only(top: 10),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide:
                                BorderSide(color: Colors.black38, width: 1.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  height: 42,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: const Icon(Icons.mic),
                )
              ],
            ),
          ),
        ),
        body: products == null
            ? const Loader()
            : Column(
                children: [
                  const AddressBox(),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: products!.length,
                    itemBuilder: (context, index) {
                      return SearchProduct(product: products![index]);
                    },
                  ))
                ],
              ));
  }
}
