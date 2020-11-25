import 'package:e_commerce/screens/CreateOrEditAddress.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/material.dart';

class SavedAddressScreen extends StatefulWidget {
  SavedAddressScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SavedAddressScreenState();
  }
}

class SavedAddressScreenState extends State<SavedAddressScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Saved addresses "),
          backgroundColor: appbarGreenColor,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: GestureDetector(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateOrEditAddressScreen()));
                  },
                      child: Text("+ Add address")),
                ),
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),boxShadow: [
                        BoxShadow(color: appbarGreenColor, spreadRadius: 3)
                      ],
                        color: whiteColor),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name and \n address \n pincode"),
                          VerticalDivider(width: 400,),
                          Expanded(
                            child: Align(alignment: Alignment.bottomCenter,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                Text("Edit"),
                                Text("Remove")
                              ],),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
