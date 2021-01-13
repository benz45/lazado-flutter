import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:naiban/models/Products.dart';
import 'package:naiban/themes/color_app.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product products;

  const ProductDetailScreen({Key key, this.products}) : super(key: key);
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  PersistentBottomSheetController _controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _counter = 1;
  _removeCounter() {
    _controller.setState(() {
      _counter -= 1;
    });
  }

  _setCounter() {
    _controller.setState(() {
      _counter += 1;
    });
  }

  showBottomSheetCounter(size) async {
    _controller =
        _scaffoldKey.currentState.showBottomSheet((context) => Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              height: 250,
              child: Stack(
                children: [
                  Container(
                    width: size.width,
                    height: size.height,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(color: Colors.black),
                                child: Image.network(
                                  widget.products.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.products.title,
                                      style: textStyleFontHead,
                                    ),
                                    Text(
                                      widget.products.price.toString() + '฿',
                                      style: textStyleFontPriceHead,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "จำนวน",
                                style: textStyleFontHead,
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: _counter > 1 ? _removeCounter : null,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 40,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey.withOpacity(0.5)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text("$_counter"),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: _counter >= 1 ? _setCounter : null,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        margin: EdgeInsets.all(20),
                        alignment: Alignment.center,
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: 250,
            child: Image.network(
              widget.products.image,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 10),
                  child: Container(
                    alignment: Alignment.center,
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 18,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 5),
                      child: Container(
                        alignment: Alignment.center,
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 20,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10.0, left: 5, right: 10),
                      child: Container(
                        alignment: Alignment.center,
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.shopping_cart,
                            color: Colors.black,
                            size: 20,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: size.width,
                height: size.height * 0.69,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(26),
                        topRight: Radius.circular(26)),
                    color: Colors.white),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.red,
                              size: 20,
                            ),
                            Text(
                              widget.products.location,
                              style: textStyleFontHead,
                            )
                          ],
                        ),
                        Text(
                          widget.products.title,
                          style: textStyleHeadName,
                        ),
                        Text(
                          widget.products.price.toString() + '฿',
                          style: textStyleFontPriceHead,
                        ),
                        Text(
                          widget.products.description.toString(),
                          style: textStyleFontBody,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () => showBottomSheetCounter(size),
                  child: Container(
                    alignment: Alignment.center,
                    width: size.width * 0.75,
                    height: size.height * 0.07,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: sPrimaryColor),
                    child: Text(
                      "Buy",
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'RUS', fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          )
        ],
      ),
    );
  }
}