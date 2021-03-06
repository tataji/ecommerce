import 'package:e_commerce/main.dart';
import 'package:e_commerce/provider_model/MyCartViewModel.dart';
import 'package:e_commerce/screens/MyCartItemsList.dart';
import 'package:e_commerce/screens/SearchScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'constants.dart';

class AppUtils {
  static AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 4.0),
          child: IconButton(
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              // By default our  icon color is white
            ),
            onPressed: () {
              Navigator.pushNamed(context,SearchScreen.routeName);
            },
          ),
        ),
        Container(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/cart.svg",
                    // By default our  icon color is white
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => BottomMenuHomeScreen(
                              index: 3,
                            )));
                  },
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      // borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                        child: Consumer<MyCartViewModel>(
                            builder: (context, myCartViewModel, child) => Text(
                                 '${myCartViewModel.itemCount}',
                                  style: TextStyle(
                                      color: whiteColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ))),
                  ),
                ),
              ),
            ],
          ),
        ),
        //SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
