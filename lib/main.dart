import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcart2/CatelogScreen.dart';
import 'package:shoppingcart2/cartProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) =>CartProvider (),
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Catelogscreen()
    );
  }
}

