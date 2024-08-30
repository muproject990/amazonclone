import 'package:ecommerce_android_app/constants/globalvaariables.dart';
import 'package:ecommerce_android_app/features/home/widgets/address_box.dart';
import 'package:ecommerce_android_app/features/home/widgets/carousel_image.dart';
import 'package:ecommerce_android_app/features/home/widgets/deal_of_day.dart';
import 'package:ecommerce_android_app/features/home/widgets/top_categories.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
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
      body: const SingleChildScrollView(
        child: Column(
          children: [
            AddressBox(),
            SizedBox(height: 10),

            TopCategories(),
            SizedBox(height: 10),
            CarouselImage(),
            SizedBox(height: 10),
            DealOfDay(),

            // dealof

            // Other widgets for Home Screen
          ],
        ),
      ),
    );
  }
}
