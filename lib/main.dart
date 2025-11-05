import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_app/provider/cart_provider.dart';
import 'package:product_app/provider/nav_bar_provider.dart';
import 'package:product_app/provider/product_provider.dart';
import 'package:product_app/screens/home_screen.dart';
import 'package:product_app/screens/nav_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => NavBarProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Product App',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const NavBar(),
        );
      },
    );
  }
}
