import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerce_android_app/common/widgets/custom_button.dart';
import 'package:ecommerce_android_app/common/widgets/custom_textfield.dart';
import 'package:ecommerce_android_app/constants/globalvaariables.dart';
import 'package:ecommerce_android_app/constants/utils.dart';
import 'package:ecommerce_android_app/features/admin/services/admin_services.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = "/add-prduct";
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController bookNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final AdminServices adminServices = AdminServices();

  String category = "Mobiles";
  final _addProductFormKey = GlobalKey<FormState>();
  bool _isBtnDisabled = false;

  @override
  void dispose() {
    bookNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();

    super.dispose();
  }

  List<String> productCategories = [
    "Mobiles",
    "Essentials",
    "Appliances",
    "Books",
    "Fashion"
  ];

  List<File> images = [];

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() &&
        images.isNotEmpty &&
        _isNumeric(priceController.text) &&
        _isNumeric(quantityController.text)) {
      double price = double.parse(priceController.text);
      double quantity = double.parse(quantityController.text);

      adminServices.sellBooks(
        context: context,
        name: bookNameController.text,
        description: descriptionController.text,
        price: price,
        quantity: quantity,
        category: category,
        images: images,
      );
      setState(() {
        _isBtnDisabled = true; //
      });
    } else {
      showSnackBar(
          context, "Enter a valid numeric value for the quantity and price");
    }
    
  }

  bool _isNumeric(String value) {
    return double.tryParse(value) != null;
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            title: const Center(
              child: Text(
                "Add Product",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  // fontSize: 14,
                ),
              ),
            )),
      ),
      body: SingleChildScrollView(
          child: Form(
        key: _addProductFormKey,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              images.isNotEmpty
                  ? CarouselSlider(
                      items: images.map(
                        (i) {
                          return Builder(
                            builder: (BuildContext context) => Image.file(
                              i,
                              fit: BoxFit.cover,
                              height: 200,
                            ),
                          );
                        },
                      ).toList(),
                      options: CarouselOptions(
                        viewportFraction: 1,
                        height: 200,
                      ),
                    )
                  : GestureDetector(
                      onTap: selectImages,
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(10),
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.only(top: 15),
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.folder_open,
                                  size: 40,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Select Book Images ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
              const SizedBox(
                height: 10,
              ),
              CustomTextfield(
                controller: bookNameController,
                hintText: "Book Name",
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextfield(
                controller: descriptionController,
                hintText: "Description",
                maxLines: 7,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextfield(
                controller: priceController,
                hintText: "Price",
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextfield(
                controller: quantityController,
                hintText: "Quantity",
              ),
              SizedBox(
                width: double.infinity,
                child: DropdownButton(
                  value: category,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: productCategories.map(
                    (String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    },
                  ).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      category = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              _isBtnDisabled
                  ? const CircularProgressIndicator()
                  : CustomButton(
                      text: "Sell",
                      onTap: sellProduct,
                    )
            ],
          ),
        ),
      )),
    );
  }
}
