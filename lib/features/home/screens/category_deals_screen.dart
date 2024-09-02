// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazzon/common/widgets/loader.dart';
import 'package:amazzon/constants/global_variable.dart';
import 'package:amazzon/features/home/services/homeServices.dart';
import 'package:amazzon/features/product_detail/screens/product_detail.dart';
import 'package:amazzon/model/product.dart';
import 'package:flutter/material.dart';

class Categorydealsscreen extends StatefulWidget {
  static const String routeName = '/category-deals';

  final String category;

  const Categorydealsscreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<Categorydealsscreen> createState() => _CategoryscreenState();
}

class _CategoryscreenState extends State<Categorydealsscreen> {
  List<Product>? productList;

  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    productList = await homeServices.fetchCategoryproducts(
        context: context, category: widget.category);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Text(
            widget.category,
            style: TextStyle(color: Colors.black),
          )),
      body: productList == null
          ? const Loader()
          : Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Keep shopping for ${widget.category}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 170,
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 15),
                      itemCount: productList!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio: 1.4,
                              mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        final product = productList![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ProductDetailScreen.routeName,
                                arguments: product);
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height: 130,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 0.5),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Image.network(product.images[0]),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
    );
  }
}
