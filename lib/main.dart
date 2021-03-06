import 'package:e_commerce/provider_model/MyCartViewModel.dart';
import 'package:e_commerce/screens/CreateOrEditAddress.dart';
import 'package:e_commerce/screens/HomeScreen.dart';
import 'package:e_commerce/screens/LoginScreen.dart';
import 'package:e_commerce/screens/MyCartItemsList.dart';
import 'package:e_commerce/screens/OtpReadingScreen.dart';
import 'package:e_commerce/screens/ProductDetailsScreen.dart';
import 'package:e_commerce/screens/ProfileScreen.dart';
import 'package:e_commerce/screens/SavedAddressScreen.dart';
import 'package:e_commerce/screens/SearchScreen.dart';
import 'package:e_commerce/screens/SignUpScreen.dart';
import 'package:e_commerce/screens/SplashScreen.dart';
import 'package:e_commerce/utils/AppUtils.dart';
import 'package:e_commerce/utils/constants.dart';

/// Flutter code sample for BottomNavigationBar
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'components/NavDrawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<MyCartViewModel>(create: (_)=>MyCartViewModel())
    ],
      child: MaterialApp(
          theme: ThemeData(accentColor: appbarGreenColor,
              appBarTheme: AppBarTheme(color: appbarGreenColor)),
          title: "",
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          initialRoute: '/',
          routes: {
            LoginScreen.routeName: (context) => LoginScreen(),
            BottomMenuHomeScreen.routeName: (context) => BottomMenuHomeScreen(),
            SignUpScreen.routeName: (context) => SignUpScreen(),
            ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
            ProfileScreen.routeName: (context) => ProfileScreen(),
            SearchScreen.routeName: (context) => SearchScreen(),
            CreateOrEditAddressScreen.routeName: (context) => CreateOrEditAddressScreen(),
            OtpReadingScreen.routeName : (context) => OtpReadingScreen(),
            SavedAddressScreen.routeName : (context) => SavedAddressScreen(),
          }
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class BottomMenuHomeScreen extends StatefulWidget {
  static const routeName = '/bottomMenuHomeScreen';
  int? index;

  BottomMenuHomeScreen({Key? key, this.index}) : super(key: key);

  @override
  _BottomMenuHomeScreenState createState() => _BottomMenuHomeScreenState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _BottomMenuHomeScreenState extends State<BottomMenuHomeScreen> {
  List<int?> stack = [];
  int? _selectedIndex = 0;
  static TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text(
      'Explore UI',
      style: optionStyle,
    ),
    Text(
      'Savings UI',
      style: optionStyle,
    ),
    MyCartItemList(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.index != null) {
      _selectedIndex = widget.index;
    }
    stack.add(_selectedIndex);
  }


  void _onItemTapped(int index) {
    stack.add(index);

    setState(() {
      _selectedIndex = index;
    });
  }

  Future<bool> _onBack() async {
    if (_selectedIndex! > 0) {
      stack.removeLast();
      int pos = stack.length-1;
      int? val = stack[pos];
      setState((){
        _selectedIndex = val;
      });

      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child:   Scaffold(
      drawer: NavDrawer(),
      appBar: AppUtils.buildAppBar(context),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex!),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.ac_unit),
            label: 'Savings',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.save),
            label: 'Your Items',
          ),
        ],
        currentIndex: _selectedIndex!,
        selectedItemColor: appbarGreenColor,
        onTap: _onItemTapped,
      ),
    ),
    onWillPop:_onBack,);
  }
}
