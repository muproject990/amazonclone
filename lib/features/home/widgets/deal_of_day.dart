import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  // Product? product;
  // final HomeServices homeServices = HomeServices();

  // @override
  // void initState() {
  //   super.initState();
  //   fetchDealOfDay();
  // }

  // void fetchDealOfDay() async {
  //   product = await homeServices.fetchDealOfDay(context: context);
  //   setState(() {});
  // }

  // void navigateToDetailScreen() {
  //   Navigator.pushNamed(
  //     context,
  //     ProductDetailScreen.routeName,
  //     arguments: product,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: const Text(
            'Deal of the day',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Image.network(
          'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
          height: 235,
          fit: BoxFit.fitHeight,
        ),
        Container(
          padding: const EdgeInsets.only(left: 15),
          alignment: Alignment.topLeft,
          child: const Text(
            '\$100',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
          child: const Text(
            'Tester Pandu tester@gmail.comtester@gmail.comtester@gmail.comtester@gmail.comtester@gmail.comtester@gmail.comtester@gmail.comtester@gmail.comtester@gmail.comtester@gmail.com',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Image.network(
              'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.fitHeight,
            ),
            Image.network(
              'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.fitHeight,
            ),
            Image.network(
              'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.fitHeight,
            ),
            Image.network(
              'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.fitHeight,
            ),
          ]),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child: Text('See all deals',
              style: TextStyle(
                color: Colors.cyan[800],
              )),
        )
      ],
    );
  }
}
