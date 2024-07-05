import 'package:demo/ApiHelper.dart';
import 'package:demo/model/productModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<ProductModel> productList = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black26,
      appBar: AppBar(
        title: Text("E-commerce"),
        centerTitle: true,
        actions: [
          Icon(
            Icons.account_circle,
            size: 30,
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Product",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("See All",
                      style:
                          TextStyle(fontSize: 15, color: CupertinoColors.link)),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    itemCount: productList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // crossAxisSpacing: 10,
                      // mainAxisExtent: 10,
                      mainAxisSpacing: 20,
                    ),
                    padding: EdgeInsets.all(10),
                    itemBuilder: (context, index) {
                      ProductModel productData = productList[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 175,
                              child: Image.network(
                                productData.image ?? "",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Spacer(),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 86,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  borderRadius: BorderRadius.only(
                                      // topLeft: Radius.circular(40),
                                      ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${productData.title}",
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "${productData.category}",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "\$ ${productData.price}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400),
                                    ),
                                    // Text(
                                    //   "\$ ${productData.id}",
                                    //   style: TextStyle(
                                    //       fontWeight: FontWeight.w400),
                                    // ),
                                    RatingBar.builder(
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 20,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.lightBlueAccent,
                                        size: 10,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  Center(child: CircularProgressIndicator());
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          )
        ],
      ),
    );
  }
}
