import 'file:///C:/Users/91850/Desktop/Deepak/Main%20File/Android%20Files/e_commerce/lib/utils/AppUtils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/components/item_card.dart';
import 'package:e_commerce/models/Product.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductDetailsScreen extends StatefulWidget {
  Product product;
  ProductDetailsScreen({Key key,this.product}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductDetailsScreenState();
  }
}

class ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppUtils.buildAppBar(),
      body: GestureDetector(
        // onTap: press,
        child: Container(
          height: MediaQuery.of(context).size.height-250,
          width: MediaQuery.of(context).size.width,
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: MediaQuery.of(context).size.width ,
                child: Padding(
                  padding: const EdgeInsets.only(top:10.0,bottom: 10),
                  child: CarouselSlider(
                    options: CarouselOptions(height: 250.0),
                    items: [1,2,3,4,5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  color: Colors.black12),
                              child: Center(child: Text('Image $i', style: TextStyle(fontSize: 16.0),))
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.all(defaultPadding),
                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Product name',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                    Text('description',style: TextStyle(fontSize: 12),),
                    Text('Price:',style: TextStyle(fontSize: 12),),
                  ],),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,color: whiteColor,
                child:Padding(
                  padding: const EdgeInsets.only(left:15.0,right: 15),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total amount"),
                      Container(height: 50,width: 200,
                        child: RaisedButton(disabledColor: appbarGreenColor,
                          child: Text("Place Order",style: TextStyle(color: whiteColor),),),
                      ),
                    ],),
                ),)
            ],
          ),
        ),
      ),
    );
  }
}